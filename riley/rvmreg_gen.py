# Emit a standalone Luau register-VM interpreter.
# The program (protos + constant pool) is serialized to a flat byte blob and rebuilt at
# runtime by a deserializer -- so static dumping of the bytecode/constants is defeated,
# matching the tree-walker's anti-dump. Constants are strings; instruction args use a
# correct signed (zig-zag) varint (the register VM uses -1 sentinels for multret).
import rasm, struct

def lua_str(b):
    if isinstance(b,str): b=b.encode()
    out=[]
    for x in b:
        if x==92: out.append('\\\\')
        elif x==34: out.append('\\"')
        elif 32<=x<127: out.append(chr(x))
        else: out.append('\\%03d'%x)   # 3-digit padded so a following digit char cannot merge into the escape
    return '"'+''.join(out)+'"'

def serialize_reg(prog):
    out=bytearray()
    def uv(n):
        while True:
            b=n&0x7f; n>>=7
            out.append(b|0x80 if n else b)
            if not n: break
    def sv(n): uv(2*n if n>=0 else -2*n-1)         # zig-zag
    def st(b):
        if isinstance(b,str): b=b.encode()
        uv(len(b)); out.extend(b)
    uv(len(prog['consts']))
    for c in prog['consts']: st(c)
    uv(len(prog['protos']))
    for p in prog['protos']:
        uv(p['nreg']); uv(p['params']); uv(1 if p['vararg'] else 0)
        uv(len(p['code']))
        for ins in p['code']:
            uv(len(ins))
            for a in ins:
                if isinstance(a, float):
                    out.append(1); out.extend(struct.pack('<d', a))
                else:
                    out.append(0); sv(a)
        uv(len(p['upvals']))
        for tag,idx in p['upvals']:
            uv(0 if tag=='local' else 1); uv(idx)
        uv(len(p['boxedp']))
        for b in p['boxedp']: uv(1 if b else 0)
    return bytes(out)

DESER = r'''local function _deser(s)
 local pos=1; local byte=string.byte; local sub=string.sub
 local function uv() local r,sh=0,0 while true do local b=byte(s,pos);pos=pos+1;r=r+(b%128)*2^sh;if b<128 then break end;sh=sh+7 end return r end
 local function sv() local u=uv() if u%2==0 then return u/2 else return -(u+1)/2 end end
 local function st() local n=uv();local b=sub(s,pos,pos+n-1);pos=pos+n;return b end
 local K={}; local nc=uv(); for i=1,nc do K[i]=st() end
 local protos={}; local np=uv()
 for i=1,np do
  local nreg=uv(); local params=uv(); local vararg=uv()==1
  local nins=uv(); local code={}
  for j=1,nins do local k=uv(); local ins={}; for a=1,k do
    local tg=byte(s,pos); pos=pos+1
    if tg==0 then ins[a]=sv() else local v;v,pos=string.unpack("<d",s,pos);ins[a]=v end
   end; code[j]=ins end
  local nu=uv(); local upvals={}
  for j=1,nu do upvals[j]={uv(),uv()} end
  local nb=uv(); local boxedp={}
  for j=1,nb do boxedp[j]=uv() end
  protos[i]={code=code,nreg=nreg,params=params,vararg=vararg,upvals=upvals,boxedp=boxedp}
 end
 return protos,K
end
local protos,K=_deser(BLOB)
'''

# dispatch order: hottest opcodes first (the if/elseif chain is checked top-down)
HOT=['MOVE','GETLOCAL','SETLOCAL','LOADN','LOADK','CALL','RET','JF','JMP','JT',
     'ADD','SUB','MUL','LT','LE','EQ','GETTABLE','SETTABLE','GETGLOBAL','GETUPVAL',
     'SETUPVAL','NEWLOCAL','SELF','NEWTABLE','SETLIST','LOADNIL','LOADB','SETGLOBAL',
     'DIV','IDIV','MOD','POW','CONCAT','NE','NOT','UNM','LEN','BAND','BOR','BXOR',
     'SHL','SHR','BNOT','VARARG','CLOSURE','ITER']

BODY={
'LOADK':'R[ins[2]]=K[ins[3]]','LOADN':'R[ins[2]]=ins[3]','LOADB':'R[ins[2]]=(ins[3]==1)',
'LOADNIL':'R[ins[2]]=nil','MOVE':'R[ins[2]]=R[ins[3]]','GETLOCAL':'R[ins[2]]=R[ins[3]][1]',
'SETLOCAL':'R[ins[2]][1]=R[ins[3]]','NEWLOCAL':'R[ins[2]]={R[ins[3]]}','GETUPVAL':'R[ins[2]]=U[ins[3]][1]',
'SETUPVAL':'U[ins[2]][1]=R[ins[3]]','GETGLOBAL':'R[ins[2]]=G[K[ins[3]]]','SETGLOBAL':'G[K[ins[2]]]=R[ins[3]]',
'GETTABLE':'R[ins[2]]=R[ins[3]][R[ins[4]]]','SETTABLE':'R[ins[2]][R[ins[3]]]=R[ins[4]]','NEWTABLE':'R[ins[2]]={}',
'SETLIST':'local t=R[ins[2]];local st_=ins[3];local cnt=ins[4];local base=ins[5];if cnt==-1 then cnt=top-base end;for i=1,cnt do t[st_+i-1]=R[base+i-1] end',
'ADD':'R[ins[2]]=R[ins[3]]+R[ins[4]]','SUB':'R[ins[2]]=R[ins[3]]-R[ins[4]]','MUL':'R[ins[2]]=R[ins[3]]*R[ins[4]]',
'DIV':'R[ins[2]]=R[ins[3]]/R[ins[4]]','IDIV':'R[ins[2]]=R[ins[3]]//R[ins[4]]','MOD':'R[ins[2]]=R[ins[3]]%R[ins[4]]',
'POW':'R[ins[2]]=R[ins[3]]^R[ins[4]]','CONCAT':'R[ins[2]]=R[ins[3]]..R[ins[4]]',
'BAND':'R[ins[2]]=bit32.band(R[ins[3]],R[ins[4]])','BOR':'R[ins[2]]=bit32.bor(R[ins[3]],R[ins[4]])',
'BXOR':'R[ins[2]]=bit32.bxor(R[ins[3]],R[ins[4]])','SHL':'R[ins[2]]=bit32.lshift(R[ins[3]],R[ins[4]])',
'SHR':'R[ins[2]]=bit32.rshift(R[ins[3]],R[ins[4]])','BNOT':'R[ins[2]]=bit32.bnot(R[ins[3]])',
'EQ':'R[ins[2]]=(R[ins[3]]==R[ins[4]])','NE':'R[ins[2]]=(R[ins[3]]~=R[ins[4]])',
'LT':'R[ins[2]]=(R[ins[3]]<R[ins[4]])','LE':'R[ins[2]]=(R[ins[3]]<=R[ins[4]])',
'NOT':'R[ins[2]]=(not R[ins[3]])','UNM':'R[ins[2]]=(-R[ins[3]])','LEN':'R[ins[2]]=(#R[ins[3]])',
'JMP':'pc=ins[2]+1','JF':'if not R[ins[3]] then pc=ins[2]+1 end','JT':'if R[ins[3]] then pc=ins[2]+1 end',
'SELF':'local o=R[ins[3]];R[ins[2]+1]=o;R[ins[2]]=o[K[ins[4]]]',
'VARARG':'local r=ins[2];local cnt=ins[3];if cnt==-1 then for i=1,VA.n do R[r+i-1]=VA[i] end;top=r+VA.n else for i=1,cnt do R[r+i-1]=VA[i] end end',
'CALL':'local base=ins[2];local nargs=ins[3];local nres=ins[4];local f=R[base];if nargs>=0 and nres==1 then if nargs==0 then R[base]=f() elseif nargs==1 then R[base]=f(R[base+1]) elseif nargs==2 then R[base]=f(R[base+1],R[base+2]) elseif nargs==3 then R[base]=f(R[base+1],R[base+2],R[base+3]) else local ca={};for i=1,nargs do ca[i]=R[base+i] end;R[base]=f(unpack(ca,1,nargs)) end elseif nargs>=0 and nres==0 then if nargs==0 then f() elseif nargs==1 then f(R[base+1]) elseif nargs==2 then f(R[base+1],R[base+2]) elseif nargs==3 then f(R[base+1],R[base+2],R[base+3]) else local ca={};for i=1,nargs do ca[i]=R[base+i] end;f(unpack(ca,1,nargs)) end else local a;if nargs==-1 then a=top-(base+1) else a=nargs end;local ca={};for i=1,a do ca[i]=R[base+i] end;local res=pack(f(unpack(ca,1,a)));if nres==-1 then for i=1,res.n do R[base+i-1]=res[i] end;top=base+res.n else for i=1,nres do R[base+i-1]=res[i] end end end',
'CLOSURE':'local cp=protos[ins[3]];local ups={};for i=1,#cp.upvals do local sp=cp.upvals[i];if sp[1]==0 then ups[i-1]=R[sp[2]] else ups[i-1]=U[sp[2]] end end;R[ins[2]]=mkclosure(ins[3],ups)',
'ITER':'local b=ins[2];R[b],R[b+1],R[b+2]=_iter(R[b],R[b+1],R[b+2])',
'RET':'local base=ins[2];local cnt=ins[3];if cnt==1 then return R[base] elseif cnt==0 then return else if cnt==-1 then cnt=top-base end;local rv={};for i=1,cnt do rv[i]=R[base+i-1] end;return unpack(rv,1,cnt) end',
}

def _rid(rng): return ''.join(rng.choice('abcdefghijklmnopqrstuvwxyz') for _ in range(7))

def _arity(body):                                   # how many operands an opcode body reads
    a=0
    for k in range(4):
        if 'ins[%d]'%(2+k) in body: a=k+1
    return a

def apply_operand_perm(prog, perms):
    # METAMORPHIC: within each instruction, operand j is stored at slot perms[arity][j] (no padding).
    # The VM reads operand j from ins[2+perms[arity][j]] (build_vm sub()), so encoder & decoder agree
    # while the operand layout differs every build.
    for p in prog['protos']:
        nc=[]
        for ins in p['code']:
            ops=ins[1:]; a=len(ops)
            if a<=1: nc.append(ins); continue
            perm=perms[a]; slots=[None]*a
            for j,val in enumerate(ops): slots[perm[j]]=val
            nc.append([ins[0]]+slots)
        p['code']=nc

def build_vm(rng, perms, junk_ops):
    def sub(body):                                  # remap operand references to permuted slots
        a=_arity(body)
        if a<=1: return body
        perm=perms[a]
        for k in range(a): body=body.replace('ins[%d]'%(2+k), '\x00%d\x00'%k)
        for k in range(a): body=body.replace('\x00%d\x00'%k, 'ins[%d]'%(2+perm[k]))
        return body
    bodies=dict(BODY)
    order=list(HOT)
    if rng is not None:
        front=order[:10]; back=order[10:]; rng.shuffle(front); rng.shuffle(back); order=front+back
    branches=[('O_%s'%n, sub(bodies[n])) for n in order]
    for num, bn in junk_ops:                        # dead-opcode branches (never emitted -> never run)
        branches.insert(rng.randint(1,max(1,len(branches))), (str(num), sub(BODY[bn])))
    lines=[]
    for i,(cond,body) in enumerate(branches):
        lines.append('    %s op==%s then %s'%('if' if i==0 else 'elseif', cond, body))
    lines.append('    else error("bad op "..tostring(op)) end')
    dispatch='\n'.join(lines)
    jl=''
    if rng is not None:
        for _ in range(rng.randint(2,5)): jl+='local _%s=%d\n'%(_rid(rng), rng.randint(1,1<<30))
    return jl+r'''local unpack=table.unpack or unpack
local pack=table.pack
local function _iter(f,s,c)                 -- Luau generalized iteration
  if type(f)=="function" then return f,s,c end
  local mt=getmetatable(f)
  if mt then local it=mt.__iter if it then return it(f) end end
  return next,f,nil
end
local mkclosure
local function exec(proto, U, R, VA)
  local code=proto.code
  local pc=1
  local top=0
  while true do
    local ins=code[pc]; pc=pc+1
    local op=ins[1]
'''+dispatch+r'''
  end
end
local _NOVA={n=0}                 -- shared empty vararg block (VM never writes VA)
mkclosure=function(pi, ups)
  local proto=protos[pi]
  local np=proto.params; local bp=proto.boxedp
  local anyboxed=false
  for i=1,np do if bp[i]==1 then anyboxed=true break end end
  if not proto.vararg then
    if not anyboxed then           -- hottest path: fixed params, none captured -> no pack, no VA
      return function(...)
        local R={}
        for i=0,np-1 do R[i]=select(i+1,...) end
        return exec(proto, ups, R, _NOVA)
      end
    end
    return function(...)
      local R={}
      for i=0,np-1 do local v=select(i+1,...); if bp[i+1]==1 then R[i]={v} else R[i]=v end end
      return exec(proto, ups, R, _NOVA)
    end
  end
  return function(...)            -- vararg path
    local args=pack(...)
    local R={}
    for i=0,np-1 do if bp[i+1]==1 then R[i]={args[i+1]} else R[i]=args[i+1] end end
    local VA={n=0}; local k=0; for i=np+1,args.n do k=k+1; VA[k]=args[i] end; VA.n=k
    return exec(proto, ups, R, VA)
  end
end
return mkclosure(__ENTRY__, {})(...)
'''

def scramble_reg(prog, rng, intensity=1.0):
    # Insert DEAD instruction blocks: a forward JMP skips over junk that never executes.
    # Dead code can reference any register safely (it never runs), and it adds both fake
    # instructions and extra control flow for a devirtualizer to untangle. Real jump targets
    # are remapped; inserted skip-jumps are given final positions directly.
    OP=rasm.OP
    JMP=OP['JMP']; JF=OP['JF']; JT=OP['JT']; JUMPS=(JMP,JF,JT)
    LOADN=OP['LOADN']; ADD=OP['ADD']; SUB=OP['SUB']; MUL=OP['MUL']
    GETTABLE=OP['GETTABLE']; MOVE=OP['MOVE']; CALL=OP['CALL']; GETGLOBAL=OP['GETGLOBAL']
    nconst=len(prog['consts'])
    for p in prog['protos']:
        nr=max(2, p['nreg'])
        def deadjunk():
            a=rng.randrange(nr); b=rng.randrange(nr); c=rng.randrange(nr)
            return rng.choice([
                [LOADN, a, rng.randint(1,99999)], [ADD,a,b,c], [SUB,a,b,c], [MUL,a,b,c],
                [GETTABLE,a,b,c], [MOVE,a,b], [CALL,a,rng.randint(0,2),1],
                [GETGLOBAL,a,rng.randint(1,max(1,nconst))],
            ])
        code=p['code']
        newcode=[]; oldtonew=[]; realjumps=[]
        for ins in code:
            oldtonew.append(len(newcode))
            pos=len(newcode); newcode.append(ins)
            if ins[0] in JUMPS: realjumps.append(pos)
            if rng.random() < 0.5*intensity:
                jpos=len(newcode); newcode.append([JMP,0])      # skip-jump (target set below)
                for _ in range(rng.randint(1,3)): newcode.append(deadjunk())
                newcode[jpos][1]=len(newcode)                   # skip lands on next real instruction
        for pos in realjumps:
            ins=newcode[pos]; t=ins[1]
            ins[1]= oldtonew[t] if t < len(oldtonew) else len(newcode)
        p['code']=newcode
    return prog

def _cksum(b):
    h=0
    for x in b: h=(h*31+x)%16777216
    return h

def generate(src, rng=None, anti_tamper=False, scramble=0.0):
    prog=rasm.compile_reg(src)
    names=rasm.OPS; defOP=prog['OP']
    if rng is not None:
        vals=rng.sample(range(2,250), len(names)); newOP=dict(zip(names, vals))
    else:
        newOP=defOP
    if scramble>0 and rng is not None:
        scramble_reg(prog, rng, intensity=scramble)
    rev={defOP[n]:newOP[n] for n in names}          # remap instruction opcodes consistently
    for pr in prog['protos']:
        for ins in pr['code']: ins[0]=rev[ins[0]]
    # --- metamorphic layer: per-build per-arity operand layout + dead-opcode branches ---
    if rng is not None:
        perms={a: rng.sample(range(a),a) for a in range(2,5)}
        used=set(newOP.values()); pool=[x for x in range(2,250) if x not in used]; rng.shuffle(pool)
        bnames=list(BODY.keys())
        junk_ops=[(pool[i], rng.choice(bnames)) for i in range(min(rng.randint(3,7), len(pool)))]
    else:
        perms={a: list(range(a)) for a in range(2,5)}; junk_ops=[]
    apply_operand_perm(prog, perms)
    opdefs='\n'.join('local O_%s=%d'%(n,newOP[n]) for n in names)
    blob=serialize_reg(prog)
    gcap='{'+','.join('[%s]=%s'%(lua_str(g),g) for g in prog['globals'])+'}'
    vm=build_vm(rng, perms, junk_ops)
    extra=''; entry='1'
    if anti_tamper:
        ck=_cksum(blob)
        extra=('local function _ck(s) local h=0 for i=1,#s do h=(h*31+string.byte(s,i))%%16777216 end return h end\n'
               'local _CK=%d\n' % ck)
        entry='(1+_CK-_ck(BLOB))'
    vm=vm.replace('__ENTRY__', entry)
    # G is the live global environment (getfenv) so global reads/writes are real and
    # visible across script boundaries; the snapshot is a fallback if getfenv is unavailable.
    header='local BLOB=%s\n%s%slocal G=(getfenv and getfenv(1)) or %s\n' % (lua_str(blob), DESER, extra, gcap)
    return opdefs+'\n'+header+vm

if __name__=='__main__':
    import sys
    print(generate(open(sys.argv[1]).read()))
