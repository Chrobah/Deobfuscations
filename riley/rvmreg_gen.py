# Emit a standalone Luau register-VM interpreter with the program inlined (for correctness testing).
import rasm
def lua_str(b):
    if isinstance(b,str): b=b.encode()
    out=[]
    for x in b:
        if x==92: out.append('\\\\')
        elif x==34: out.append('\\"')
        elif x==10: out.append('\\n')
        elif x==13: out.append('\\r')
        elif x==9: out.append('\\t')
        elif 32<=x<127: out.append(chr(x))
        else: out.append('\\%d'%x)
    return '"'+''.join(out)+'"'
def emit_val(v):
    if isinstance(v,(int,)) and not isinstance(v,bool): return repr(v)
    if isinstance(v,float):
        if v!=v: return '(0/0)'
        if v==float('inf'): return 'math.huge'
        if v==float('-inf'): return '-math.huge'
        return repr(v)
    if isinstance(v,str): return lua_str(v)
    raise Exception('val')
def emit_ins(ins):
    parts=[]
    for x in ins:
        if x is None: parts.append('0')
        elif isinstance(x,str): parts.append(lua_str(x))
        else: parts.append(str(x))
    return '{'+','.join(parts)+'}'
def emit_proto(p):
    code='{'+','.join(emit_ins(i) for i in p['code'])+'}'
    ups='{'+','.join('{'+lua_str(s[0])+','+str(s[1])+'}' for s in p['upvals'])+'}'
    bp='{'+','.join('true' if b else 'false' for b in p['boxedp'])+'}'
    return '{code=%s,nreg=%d,params=%d,vararg=%s,upvals=%s,boxedp=%s}'%(code,p['nreg'],p['params'],
            'true' if p['vararg'] else 'false', ups, bp)

VM=r'''
local protos=__PROTOS__
local K=__CONSTS__
local G=__GLOBALS__
local unpack=table.unpack or unpack
local pack=table.pack

local mkclosure
local function exec(proto, U, R, VA)
  local code=proto.code
  local pc=1
  local top=0
  while true do
    local ins=code[pc]; pc=pc+1
    local op=ins[1]
    if op==O_LOADK then R[ins[2]]=K[ins[3]]
    elseif op==O_LOADN then R[ins[2]]=ins[3]
    elseif op==O_LOADB then R[ins[2]]=(ins[3]==1)
    elseif op==O_LOADNIL then R[ins[2]]=nil
    elseif op==O_MOVE then R[ins[2]]=R[ins[3]]
    elseif op==O_GETLOCAL then R[ins[2]]=R[ins[3]][1]
    elseif op==O_SETLOCAL then R[ins[2]][1]=R[ins[3]]
    elseif op==O_NEWLOCAL then R[ins[2]]={R[ins[3]]}
    elseif op==O_GETUPVAL then R[ins[2]]=U[ins[3]][1]
    elseif op==O_SETUPVAL then U[ins[2]][1]=R[ins[3]]
    elseif op==O_GETGLOBAL then R[ins[2]]=G[K[ins[3]]]
    elseif op==O_SETGLOBAL then G[K[ins[2]]]=R[ins[3]]
    elseif op==O_GETTABLE then R[ins[2]]=R[ins[3]][R[ins[4]]]
    elseif op==O_SETTABLE then R[ins[2]][R[ins[3]]]=R[ins[4]]
    elseif op==O_NEWTABLE then R[ins[2]]={}
    elseif op==O_SETLIST then
      local t=R[ins[2]]; local start=ins[3]; local cnt=ins[4]; local base=ins[5]
      if cnt==-1 then cnt=top-base end
      for i=1,cnt do t[start+i-1]=R[base+i-1] end
    elseif op==O_ADD then R[ins[2]]=R[ins[3]]+R[ins[4]]
    elseif op==O_SUB then R[ins[2]]=R[ins[3]]-R[ins[4]]
    elseif op==O_MUL then R[ins[2]]=R[ins[3]]*R[ins[4]]
    elseif op==O_DIV then R[ins[2]]=R[ins[3]]/R[ins[4]]
    elseif op==O_IDIV then R[ins[2]]=R[ins[3]]//R[ins[4]]
    elseif op==O_MOD then R[ins[2]]=R[ins[3]]%R[ins[4]]
    elseif op==O_POW then R[ins[2]]=R[ins[3]]^R[ins[4]]
    elseif op==O_CONCAT then R[ins[2]]=R[ins[3]]..R[ins[4]]
    elseif op==O_BAND then R[ins[2]]=bit32.band(R[ins[3]],R[ins[4]])
    elseif op==O_BOR then R[ins[2]]=bit32.bor(R[ins[3]],R[ins[4]])
    elseif op==O_BXOR then R[ins[2]]=bit32.bxor(R[ins[3]],R[ins[4]])
    elseif op==O_SHL then R[ins[2]]=bit32.lshift(R[ins[3]],R[ins[4]])
    elseif op==O_SHR then R[ins[2]]=bit32.rshift(R[ins[3]],R[ins[4]])
    elseif op==O_EQ then R[ins[2]]=(R[ins[3]]==R[ins[4]])
    elseif op==O_NE then R[ins[2]]=(R[ins[3]]~=R[ins[4]])
    elseif op==O_LT then R[ins[2]]=(R[ins[3]]<R[ins[4]])
    elseif op==O_LE then R[ins[2]]=(R[ins[3]]<=R[ins[4]])
    elseif op==O_NOT then R[ins[2]]=(not R[ins[3]])
    elseif op==O_UNM then R[ins[2]]=(-R[ins[3]])
    elseif op==O_LEN then R[ins[2]]=(#R[ins[3]])
    elseif op==O_BNOT then R[ins[2]]=bit32.bnot(R[ins[3]])
    elseif op==O_JMP then pc=ins[2]+1
    elseif op==O_JF then if not R[ins[3]] then pc=ins[2]+1 end
    elseif op==O_JT then if R[ins[3]] then pc=ins[2]+1 end
    elseif op==O_SELF then local o=R[ins[3]]; R[ins[2]+1]=o; R[ins[2]]=o[K[ins[4]]]
    elseif op==O_VARARG then
      local r=ins[2]; local cnt=ins[3]
      if cnt==-1 then for i=1,VA.n do R[r+i-1]=VA[i] end; top=r+VA.n
      else for i=1,cnt do R[r+i-1]=VA[i] end end
    elseif op==O_CALL then
      local base=ins[2]; local nargs=ins[3]; local nres=ins[4]
      local a; if nargs==-1 then a=top-(base+1) else a=nargs end
      local ca={}; for i=1,a do ca[i]=R[base+i] end
      local f=R[base]
      local res=pack(f(unpack(ca,1,a)))
      if nres==-1 then for i=1,res.n do R[base+i-1]=res[i] end; top=base+res.n
      else for i=1,nres do R[base+i-1]=res[i] end end
    elseif op==O_CLOSURE then
      local cp=protos[ins[3]]; local ups={}
      for i=1,#cp.upvals do
        local sp=cp.upvals[i]
        if sp[1]=="local" then ups[i-1]=R[sp[2]] else ups[i-1]=U[sp[2]] end
      end
      R[ins[2]]=mkclosure(ins[3], ups)
    elseif op==O_RET then
      local base=ins[2]; local cnt=ins[3]
      if cnt==-1 then cnt=top-base end
      if cnt==0 then return
      else local rv={}; for i=1,cnt do rv[i]=R[base+i-1] end; return unpack(rv,1,cnt) end
    else error("bad op "..tostring(op)) end
  end
end
mkclosure=function(pi, ups)
  local proto=protos[pi]
  return function(...)
    local args=pack(...)
    local R={}
    local bp=proto.boxedp
    for i=0,proto.params-1 do if bp[i+1] then R[i]={args[i+1]} else R[i]=args[i+1] end end
    local VA={n=0}
    if proto.vararg then local k=0; for i=proto.params+1,args.n do k=k+1; VA[k]=args[i] end; VA.n=k end
    return exec(proto, ups, R, VA)
  end
end
return mkclosure(1, {})(...)
'''
def generate(src, rng=None):
    prog=rasm.compile_reg(src)
    names=rasm.OPS; defOP=prog['OP']
    if rng is not None:
        vals=rng.sample(range(2,250), len(names)); newOP=dict(zip(names, vals))
    else:
        newOP=defOP
    rev={defOP[n]:newOP[n] for n in names}          # remap instruction opcodes consistently
    for pr in prog['protos']:
        for ins in pr['code']: ins[0]=rev[ins[0]]
    opdefs='\n'.join('local O_%s=%d'%(n,newOP[n]) for n in names)
    protos='{'+','.join(emit_proto(p) for p in prog['protos'])+'}'
    consts='{'+','.join('[%d]=%s'%(i+1,lua_str(c)) for i,c in enumerate(prog['consts']))+'}'
    gcap='{'+','.join('[%s]=%s'%(lua_str(g),g) for g in prog['globals'])+'}'
    body=VM.replace('__PROTOS__',protos).replace('__CONSTS__',consts).replace('__GLOBALS__',gcap)
    return opdefs+'\n'+body
if __name__=='__main__':
    import sys
    print(generate(open(sys.argv[1]).read()))
