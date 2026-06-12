-- ===== riley VM runtime (consumes PROTOS, K, G injected by serializer) =====
local select,error,setmetatable,rawget = select,error,setmetatable,rawget
local tpack = table.pack or function(...) return {n=select('#',...),...} end
local tunpack = table.unpack or unpack
local bit32 = bit32

-- opcodes (match compiler)
--@OPCODES@

local eval1, evalm, exec_block, make_closure

local function binop(o,a,b)
  if o==1 then return a+b elseif o==2 then return a-b elseif o==3 then return a*b
  elseif o==4 then return a/b elseif o==5 then return a//b elseif o==6 then return a%b
  elseif o==7 then return a^b elseif o==8 then return a..b
  elseif o==9 then return a==b elseif o==10 then return a~=b
  elseif o==11 then return a<b elseif o==12 then return a<=b elseif o==13 then return a>b elseif o==14 then return a>=b
  elseif o==15 then return bit32.band(a,b) elseif o==16 then return bit32.bor(a,b) elseif o==17 then return bit32.bxor(a,b)
  elseif o==18 then return bit32.lshift(a,b) elseif o==19 then return bit32.rshift(a,b) end
end
local function unop(o,a)
  if o==1 then return -a elseif o==2 then return not a elseif o==3 then return #a elseif o==4 then return bit32.bnot(a) end
end

local function cell(scope, vid)
  while scope do local c=scope[2][vid]; if c then return c end; scope=scope[1] end
end
local function varargs(scope)
  while scope do if scope[3] then return scope[3] end; scope=scope[1] end
  return {n=0}
end

local function eval_list(list, scope)
  local n=#list
  if n==0 then return {n=0} end
  local out={}
  for i=1,n-1 do out[i]=eval1(list[i],scope) end
  local last=list[n]; local lo=last[1]
  if lo==CALL or lo==METHOD or lo==VARARG then
    local m=evalm(last,scope); local base=n-1
    for i=1,m.n do out[base+i]=m[i] end
    out.n=base+m.n
  else out[n]=eval1(last,scope); out.n=n end
  return out
end

local function eval_table(fields, scope)
  local t={}; local arr=0; local n=#fields
  for i=1,n do
    local f=fields[i]
    if f[1]==0 then
      local node=f[2]
      if i==n and (node[1]==CALL or node[1]==METHOD or node[1]==VARARG) then
        local m=evalm(node,scope); for j=1,m.n do arr=arr+1; t[arr]=m[j] end
      else arr=arr+1; t[arr]=eval1(node,scope) end
    else t[eval1(f[2],scope)]=eval1(f[3],scope) end
  end
  return t
end

function eval1(node, scope)
  local op=node[1]
  if op==LOCAL then return cell(scope,node[2])[1]
  elseif op==NUM then return node[2]
  elseif op==STR then return K[node[2]]
  elseif op==GLOBAL then return G[K[node[2]]]
  elseif op==INDEX then return eval1(node[2],scope)[eval1(node[3],scope)]
  elseif op==BINOP then return binop(node[2], eval1(node[3],scope), eval1(node[4],scope))
  elseif op==CALL or op==METHOD then local m=evalm(node,scope); return m[1]
  elseif op==NIL then return nil
  elseif op==TRUE then return true
  elseif op==FALSE then return false
  elseif op==AND then local a=eval1(node[2],scope); if a then return eval1(node[3],scope) else return a end
  elseif op==OR then local a=eval1(node[2],scope); if a then return a else return eval1(node[3],scope) end
  elseif op==UNOP then return unop(node[2], eval1(node[3],scope))
  elseif op==FUNC then return make_closure(node[2], scope)
  elseif op==TABLE then return eval_table(node[2], scope)
  elseif op==VARARG then return varargs(scope)[1]
  elseif op==IFEXPR then if eval1(node[2],scope) then return eval1(node[3],scope) else return eval1(node[4],scope) end
  elseif op==PAREN then return eval1(node[2],scope)
  end
end

function evalm(node, scope)
  local op=node[1]
  if op==CALL then
    local fn=eval1(node[2],scope); local a=eval_list(node[3],scope)
    return tpack(fn(tunpack(a,1,a.n)))
  elseif op==METHOD then
    local obj=eval1(node[2],scope); local m=obj[K[node[3]]]; local a=eval_list(node[4],scope)
    local a2={obj}; for i=1,a.n do a2[i+1]=a[i] end
    return tpack(m(tunpack(a2,1,a.n+1)))
  elseif op==VARARG then return varargs(scope)
  else return {n=1, eval1(node,scope)} end
end

local function assign(tg, val, scope)
  local k=tg[1]
  if k=='L' then cell(scope,tg[2])[1]=val
  elseif k=='G' then G[K[tg[2]]]=val
  else eval1(tg[2],scope)[eval1(tg[3],scope)]=val end
end

local function exec_stmt(node, scope)
  local op=node[1]
  if op==LOCALDECL then
    local vids,exprs=node[2],node[3]; local v=eval_list(exprs,scope)
    local sv=scope[2]
    for i=1,#vids do sv[vids[i]]={v[i]} end
  elseif op==CALLSTAT then evalm(node[2],scope)
  elseif op==ASSIGN then
    local tg,ex=node[2],node[3]; local v=eval_list(ex,scope)
    for i=1,#tg do assign(tg[i], v[i], scope) end
  elseif op==COMPOUND then
    local tg=node[3]; local r=eval1(node[4],scope)
    if tg[1]=='L' then local c=cell(scope,tg[2]); c[1]=binop(node[2],c[1],r)
    elseif tg[1]=='G' then local nm=K[tg[2]]; G[nm]=binop(node[2],G[nm],r)
    else local o=eval1(tg[2],scope); local key=eval1(tg[3],scope); o[key]=binop(node[2],o[key],r) end
  elseif op==IF then
    local arms=node[2]
    for i=1,#arms do
      if eval1(arms[i][1],scope) then return exec_block(arms[i][2], {scope,{}}) end
    end
    if node[3]~=0 then return exec_block(node[3], {scope,{}}) end
  elseif op==WHILE then
    while eval1(node[2],scope) do
      local sig=exec_block(node[3], {scope,{}})
      if sig then if sig[1]=='break' then break elseif sig[1]~='continue' then return sig end end
    end
  elseif op==FORNUM then
    local vid=node[2]; local i=eval1(node[3],scope); local stop=eval1(node[4],scope)
    local step= node[5]~=0 and eval1(node[5],scope) or 1
    while (step>0 and i<=stop) or (step<0 and i>=stop) do
      local bs={scope,{}}; bs[2][vid]={i}
      local sig=exec_block(node[6], bs)
      if sig then if sig[1]=='break' then break elseif sig[1]~='continue' then return sig end end
      i=i+step
    end
  elseif op==FORIN then
    local vids=node[2]; local it=eval_list(node[3],scope)
    local f,st,ctrl=it[1],it[2],it[3]
    if type(f)~="function" then            -- Luau generalized iteration (tables / __iter)
      local mt=getmetatable(f)
      if mt and mt.__iter then f,st,ctrl=mt.__iter(f) else f,st,ctrl=next,f,nil end
    end
    while true do
      local r=tpack(f(st,ctrl))
      if r[1]==nil then break end
      ctrl=r[1]
      local bs={scope,{}}; for i=1,#vids do bs[2][vids[i]]={r[i]} end
      local sig=exec_block(node[4], bs)
      if sig then if sig[1]=='break' then break elseif sig[1]~='continue' then return sig end end
    end
  elseif op==REPEAT then
    while true do
      local bs={scope,{}}
      local sig=exec_block(node[2], bs)
      if sig then if sig[1]=='break' then break elseif sig[1]~='continue' then return sig end end
      if eval1(node[3], bs) then break end
    end
  elseif op==DO then return exec_block(node[2], {scope,{}})
  elseif op==RETURN then return {'return', eval_list(node[2],scope)}
  elseif op==BREAK then return {'break'}
  elseif op==CONTINUE then return {'continue'}
  end
end

function exec_block(block, scope)
  for i=1,#block do
    local sig=exec_stmt(block[i], scope)
    if sig then return sig end
  end
end

function make_closure(pidx, defscope)
  local proto=PROTOS[pidx]; local params=proto.params; local np=#params; local va=proto.vararg
  local body=proto.body
  return function(...)
    local fs={defscope,{}}
    local sv=fs[2]
    for i=1,np do sv[params[i]]={(select(i,...))} end
    if va then
      local total=select('#',...); local v={n=total-np}
      for i=np+1,total do v[i-np]=select(i,...) end
      fs[3]=v
    else fs[3]={n=0} end
    local sig=exec_block(body, fs)
    if sig and sig[1]=='return' then local p=sig[2]; return tunpack(p,1,p.n) end
  end
end

return make_closure(1, nil)(...)
