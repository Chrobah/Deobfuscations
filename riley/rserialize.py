# Serialize the compiled program + VM into a runnable Luau file.
import sys
from rcompile import compile_src

import struct
def _uvarint(n):
    out=bytearray()
    while True:
        b=n&0x7f; n>>=7
        if n: out.append(b|0x80)
        else: out.append(b); break
    return bytes(out)
def _zig(n): return _uvarint((n<<1) ^ (n>>63) if n>=0 else ((-n)<<1)-1)
def _ser(v, out):
    if isinstance(v,bool):
        out.append(2); out+= _uvarint((1<<1) if v else 0)   # bool as int 1/0
    elif isinstance(v,int):
        out.append(2); out+= _uvarint((v<<1) if v>=0 else ((-v)<<1)|1)
    elif isinstance(v,float):
        out.append(3); out+= struct.pack('<d', v)
    elif isinstance(v,(bytes,bytearray)):
        out.append(4); out+= _uvarint(len(v)); out+= bytes(v)
    elif isinstance(v,str):
        b=v.encode(); out.append(4); out+= _uvarint(len(b)); out+= b
    elif isinstance(v,(list,tuple)):
        out.append(1); out+= _uvarint(len(v))
        for e in v: _ser(e,out)
    elif v is None:
        out.append(2); out+= _uvarint(0)
    else:
        raise Exception("ser? "+repr(type(v)))
    return out
def serialize_program(prog):
    protos=[]
    for p in prog['protos']:
        protos.append([p['params'], 1 if p['vararg'] else 0, p['body']])
    out=bytearray()
    _ser([protos, prog['consts']], out)
    return bytes(out)


def lua_str(b):
    if isinstance(b,str): b=b.encode()
    out=['"']
    for x in b:
        if x==34: out.append('\\"')
        elif x==92: out.append('\\\\')
        elif 32<=x<127: out.append(chr(x))
        else: out.append('\\%03d'%x)
    out.append('"'); return ''.join(out)

def lua_num(n):
    if isinstance(n,int): return str(n)
    if n!=n: return '(0/0)'
    if n==float('inf'): return '(1/0)'
    if n==float('-inf'): return '(-1/0)'
    r=repr(n)
    return r

def emit_node(x):
    # x is a python list/tuple (node) or scalar
    if isinstance(x,(list,tuple)):
        return '{'+','.join(emit_node(e) for e in x)+'}'
    if isinstance(x,bool):
        return 'true' if x else 'false'
    if isinstance(x,(int,float)):
        return lua_num(x)
    if isinstance(x,str):
        return lua_str(x)   # used for 'L'/'G'/'I' target tags
    if x is None:
        return '0'
    raise Exception("emit? "+repr(type(x)))

def emit_proto(p):
    return '{params={%s},vararg=%s,body=%s}' % (
        ','.join(str(v) for v in p['params']),
        'true' if p['vararg'] else 'false',
        emit_node(p['body']))

OPNAMES=['NIL','TRUE','FALSE','NUM','STR','VARARG','LOCAL','GLOBAL','INDEX','CALL','METHOD','FUNC','TABLE','BINOP','UNOP','AND','OR','IFEXPR','PAREN','LOCALDECL','ASSIGN','COMPOUND','CALLSTAT','DO','WHILE','REPEAT','IF','FORNUM','FORIN','RETURN','BREAK','CONTINUE']

DESER = """local function _deser(s)
 local pos=1; local byte=string.byte; local sub=string.sub; local unpack=string.unpack
 local function uv() local r,sh=0,0 while true do local b=byte(s,pos);pos=pos+1;r=r+(b%128)*(2^sh);if b<128 then break end;sh=sh+7 end return r end
 local function rd()
  local t=byte(s,pos);pos=pos+1
  if t==1 then local n=uv();local a={};for i=1,n do a[i]=rd() end;return a
  elseif t==2 then local u=uv();if u%2==1 then return -((u-1)/2)-1 else return u/2 end
  elseif t==3 then local v=unpack("<d",s,pos);pos=pos+8;return v
  else local n=uv();local b=sub(s,pos,pos+n-1);pos=pos+n;return b end
 end
 return rd()
end
local _prog=_deser(BLOB)
local _pl=_prog[1]; local K=_prog[2]
local PROTOS={}
for i=1,#_pl do local p=_pl[i] PROTOS[i]={params=p[1],vararg=p[2]==1,body=p[3]} end
"""

def _cksum(b):
    h=0
    for x in b: h=(h*31+x)%16777216
    return h

def emit_program(prog, vmtext, opmap, anti_tamper=False):
    blob=serialize_program(prog)
    gcap='{'+','.join('[%s]=%s'%(lua_str(g), g) for g in prog['globals'])+'}'
    opline='local '+','.join(OPNAMES)+'='+','.join(str(opmap[n]) for n in OPNAMES)
    vmtext=vmtext.replace('--@OPCODES@', opline)
    extra=''
    entry='1'
    if anti_tamper:
        ck=_cksum(blob)
        extra=('local function _ck(s) local h=0 for i=1,#s do h=(h*31+string.byte(s,i))%%16777216 end return h end\n'
               'local _CK=%d\n' % ck)
        entry='(1+_CK-_ck(BLOB))'
    vmtext=vmtext.replace('return make_closure(1, nil)(...)', extra+'return make_closure('+entry+', nil)(...)')
    header=('local BLOB=%s\n%s\nlocal G=(getfenv and getfenv(1)) or %s\n' % (lua_str(blob), DESER, gcap))
    return header+vmtext

def serialize(src, vmtext):
    import rcompile
    opmap={n:getattr(rcompile,n) for n in OPNAMES}
    prog=compile_src(src)
    return emit_program(prog, vmtext, opmap)  # (serialize() path: no anti-tamper)

if __name__=='__main__':
    vm=open('rvm.luau').read()
    out=serialize(open(sys.argv[1]).read(), vm)
    sys.stdout.write(out)
