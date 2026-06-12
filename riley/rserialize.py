# Serialize the compiled program + VM into a runnable Luau file.
import sys
from rcompile import compile_src

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

def emit_program(prog, vmtext, opmap):
    protos='{'+','.join(emit_proto(p) for p in prog['protos'])+'}'
    consts='{'+','.join(lua_str(c) for c in prog['consts'])+'}'
    gcap='{'+','.join('[%s]=%s'%(lua_str(g), g) for g in prog['globals'])+'}'
    opline='local '+','.join(OPNAMES)+'='+','.join(str(opmap[n]) for n in OPNAMES)
    vmtext=vmtext.replace('--@OPCODES@', opline)
    header='local PROTOS=%s\nlocal K=%s\nlocal G=%s\n'%(protos,consts,gcap)
    return header+vmtext

def serialize(src, vmtext):
    import rcompile
    opmap={n:getattr(rcompile,n) for n in OPNAMES}
    prog=compile_src(src)
    return emit_program(prog, vmtext, opmap)

if __name__=='__main__':
    vm=open('rvm.luau').read()
    out=serialize(open(sys.argv[1]).read(), vm)
    sys.stdout.write(out)
