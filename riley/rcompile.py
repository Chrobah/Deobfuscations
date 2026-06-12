# Compile AST -> serialized VM program (nodes as nested lists), resolving scopes to varids.
from rparse import parse

# expression opcodes
NIL,TRUE,FALSE,NUM,STR,VARARG,LOCAL,GLOBAL,INDEX,CALL,METHOD,FUNC,TABLE,BINOP,UNOP,AND,OR,IFEXPR,PAREN = range(1,20)
# statement opcodes
LOCALDECL,ASSIGN,COMPOUND,CALLSTAT,DO,WHILE,REPEAT,IF,FORNUM,FORIN,RETURN,BREAK,CONTINUE,SETLOCAL,SETGLOBAL,SETINDEX = range(30,46)

BINOPS={'+':1,'-':2,'*':3,'/':4,'//':5,'%':6,'^':7,'..':8,'==':9,'~=':10,'<':11,'<=':12,'>':13,'>=':14,'&':15,'|':16,'~':17,'<<':18,'>>':19}
UNOPS={'-':1,'not':2,'#':3,'~':4}

class Compiler:
    def __init__(s):
        s.consts=[]; s.constmap={}
        s.protos=[]
        s.globals={}   # name -> True
        s.vid=0
    def kidx(s, b):
        if isinstance(b,str): b=b.encode()
        if b in s.constmap: return s.constmap[b]
        i=len(s.consts)+1; s.constmap[b]=i; s.consts.append(b); return i
    def newvid(s):
        s.vid+=1; return s.vid

    def compile(s, src):
        ast=parse(src)
        s.protos.append(None)          # reserve Luau index 1 for main
        scope=[{}, None]
        body=s.block(ast[1], scope, top=True)
        s.protos[0]={'params':[], 'vararg':True, 'body':body}
        return {'protos':s.protos, 'consts':s.consts, 'globals':sorted(s.globals)}

    def resolve(s, name, scope):
        sc=scope
        while sc:
            if name in sc[0]: return sc[0][name]
            sc=sc[1]
        s.globals[name]=True
        return None  # global

    # ---- expressions ----
    def expr(s, e, scope):
        t=e[0]
        if t=='nil': return [NIL]
        if t=='true': return [TRUE]
        if t=='false': return [FALSE]
        if t=='num': return [NUM, e[1]]
        if t=='str': return [STR, s.kidx(e[1])]
        if t=='vararg': return [VARARG]
        if t=='paren': return [PAREN, s.expr(e[1], scope)]
        if t=='name':
            vid=s.resolve(e[1], scope)
            if vid is None: return [GLOBAL, s.kidx(e[1])]
            return [LOCAL, vid]
        if t=='index': return [INDEX, s.expr(e[1],scope), s.expr(e[2],scope)]
        if t=='call': return [CALL, s.expr(e[1],scope), [s.expr(a,scope) for a in e[2]]]
        if t=='method': return [METHOD, s.expr(e[1],scope), s.kidx(e[2]), [s.expr(a,scope) for a in e[3]]]
        if t=='func': return [FUNC, s.func(e, scope)]
        if t=='table':
            fields=[]
            for f in e[1]:
                if f[0]=='item': fields.append([0, s.expr(f[1],scope)])
                else: fields.append([1, s.expr(f[1],scope), s.expr(f[2],scope)])
            return [TABLE, fields]
        if t=='binop': return [BINOP, BINOPS[e[1]], s.expr(e[2],scope), s.expr(e[3],scope)]
        if t=='unop': return [UNOP, UNOPS[e[1]], s.expr(e[2],scope)]
        if t=='and': return [AND, s.expr(e[1],scope), s.expr(e[2],scope)]
        if t=='or': return [OR, s.expr(e[1],scope), s.expr(e[2],scope)]
        if t=='ifexpr': return [IFEXPR, s.expr(e[1],scope), s.expr(e[2],scope), s.expr(e[3],scope)]
        if t=='interp':
            # desugar: concat of (bytes -> STR) and (expr -> tostring(expr))
            node=None
            for part in e[1]:
                if isinstance(part,(bytes,)): pn=[STR, s.kidx(part)]
                else: pn=[CALL,[GLOBAL,s.kidx('tostring')],[s.expr(part,scope)]]
                node = pn if node is None else [BINOP, BINOPS['..'], node, pn]
            return node if node is not None else [STR, s.kidx(b'')]
        raise Exception("expr? "+t)

    def func(s, e, scope):
        params, vararg, body = e[1], e[2], e[3]
        fscope=[{}, scope]
        pvids=[]
        for p in params:
            vid=s.newvid(); fscope[0][p]=vid; pvids.append(vid)
        b=s.block(body, fscope)
        s.protos.append({'params':pvids,'vararg':vararg,'body':b})
        return len(s.protos)  # Luau 1-based index of the just-appended proto

    # ---- statements / blocks ----
    def block(s, stmts, scope, top=False):
        bscope=[{}, scope] if not top else scope
        out=[]
        for st in stmts:
            n=s.stmt(st, bscope)
            if n is not None: out.append(n)
        return out
    def lhs(s, e, scope):
        if e[0]=='name':
            vid=s.resolve(e[1], scope)
            if vid is None: return ['G', s.kidx(e[1])]
            return ['L', vid]
        if e[0]=='index':
            return ['I', s.expr(e[1],scope), s.expr(e[2],scope)]
        raise Exception("bad assign target "+e[0])
    def stmt(s, st, scope):
        t=st[0]
        if t=='local':
            names, exprs = st[1], st[2]
            vals=[s.expr(x,scope) for x in exprs]
            vids=[]
            for nm in names:
                vid=s.newvid(); scope[0][nm]=vid; vids.append(vid)
            return [LOCALDECL, vids, vals]
        if t=='localfunc':
            nm=st[1]; vid=s.newvid(); scope[0][nm]=vid   # declare before body for recursion
            fn=[FUNC, s.func(st[2], scope)]
            return [LOCALDECL, [vid], [fn]]
        if t=='assign':
            targets=[s.lhs(x,scope) for x in st[1]]
            vals=[s.expr(x,scope) for x in st[2]]
            return [ASSIGN, targets, vals]
        if t=='compound':
            return [COMPOUND, BINOPS[st[1]], s.lhs(st[2],scope), s.expr(st[3],scope)]
        if t=='callstat': return [CALLSTAT, s.expr(st[1],scope)]
        if t=='do': return [DO, s.block(st[1], scope)]
        if t=='while': return [WHILE, s.expr(st[1],scope), s.block(st[2], scope)]
        if t=='repeat':
            # repeat body scope is visible in until-cond -> compile in same scope
            rscope=[{}, scope]
            b=[]
            for x in st[1]:
                n=s.stmt(x, rscope)
                if n is not None: b.append(n)
            cond=s.expr(st[2], rscope)
            return [REPEAT, b, cond]
        if t=='if':
            arms=[[s.expr(c,scope), s.block(bl,scope)] for c,bl in st[1]]
            els=s.block(st[2],scope) if st[2] is not None else 0
            return [IF, arms, els]
        if t=='fornum':
            start=s.expr(st[2],scope); stop=s.expr(st[3],scope); step=s.expr(st[4],scope) if st[4] else 0
            lscope=[{}, scope]; vid=s.newvid(); lscope[0][st[1]]=vid
            b=s.block_in(st[5], lscope)
            return [FORNUM, vid, start, stop, step, b]
        if t=='forin':
            exprs=[s.expr(x,scope) for x in st[2]]
            lscope=[{}, scope]; vids=[]
            for nm in st[1]:
                vid=s.newvid(); lscope[0][nm]=vid; vids.append(vid)
            b=s.block_in(st[3], lscope)
            return [FORIN, vids, exprs, b]
        if t=='return': return [RETURN, [s.expr(x,scope) for x in st[1]]]
        if t=='break': return [BREAK]
        if t=='continue': return [CONTINUE]
        if t in ('label','goto'): raise NotImplementedError("riley: 'goto'/labels are not supported; rewrite with if/while/continue")
        raise Exception("stmt? "+t)
    def block_in(s, stmts, scope):
        out=[]
        for st in stmts:
            n=s.stmt(st, scope)
            if n is not None: out.append(n)
        return out

def compile_src(src):
    c=Compiler()
    prog=c.compile(src)
    return prog

if __name__=='__main__':
    import sys
    prog=compile_src(open(sys.argv[1]).read())
    print("compiled: protos=%d consts=%d globals=%d"%(len(prog['protos']),len(prog['consts']),len(prog['globals'])))
    print("globals:", prog['globals'][:20])
