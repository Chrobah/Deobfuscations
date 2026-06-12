from rlex import lex, Tok

_ESC={'n':10,'t':9,'r':13,'a':7,'b':8,'f':12,'v':11,'\\':92,'"':34,"'":39,'\n':10,'0':48}
def decode_str(spec):
    kind,raw=spec
    if kind=='long':
        return raw.encode('utf-8','surrogatepass')
    s=raw[1:-1]; out=bytearray(); i=0
    while i<len(s):
        c=s[i]
        if c=='\\':
            d=s[i+1]
            if d=='x': out.append(int(s[i+2:i+4],16)); i+=4; continue
            if d=='z':
                i+=2
                while i<len(s) and s[i] in ' \t\r\n': i+=1
                continue
            if d=='u' and i+2<len(s) and s[i+2]=='{':
                e=s.index('}',i); out+=chr(int(s[i+3:e],16)).encode('utf-8'); i=e+1; continue
            if d.isdigit():
                j=i+1; num=''
                while j<len(s) and s[j].isdigit() and len(num)<3: num+=s[j]; j+=1
                out.append(int(num)&255); i=j; continue
            out.append(_ESC.get(d, ord(d))); i+=2; continue
        out+=c.encode('utf-8'); i+=1
    return bytes(out)

def parse_num(t):
    x=t.replace('_','')
    if x[:2] in ('0x','0X'):
        if any(ch in x for ch in '.pP'): return float.fromhex(x)
        return int(x,16)
    if x[:2] in ('0b','0B'): return int(x[2:],2)
    if any(ch in x for ch in '.eE'): return float(x)
    return int(x)

class P:
    def __init__(s,toks): s.t=toks; s.i=0
    def cur(s): return s.t[s.i]
    def nx(s): tok=s.t[s.i]; s.i+=1; return tok
    def at(s,k,v=None):
        c=s.t[s.i]; return c.k==k and (v is None or c.v==v)
    def atv(s,v): c=s.t[s.i]; return c.v==v
    def accept(s,k,v=None):
        if s.at(k,v): return s.nx()
        return None
    def expect(s,k,v=None):
        if s.at(k,v): return s.nx()
        c=s.cur(); raise SyntaxError(f"expected {k} {v!r}, got {c.k} {c.v!r} at {c.i}")
    def expectv(s,v):
        if s.atv(v): return s.nx()
        c=s.cur(); raise SyntaxError(f"expected {v!r}, got {c.k} {c.v!r} at {c.i}")

    # ---------- types (parsed and discarded) ----------
    def skip_generics(s):
        if s.atv('<'):
            depth=0
            while True:
                c=s.nx()
                if c.v=='<': depth+=1
                elif c.v=='>':
                    depth-=1
                    if depth==0: break
                elif c.v=='>>':  # >> closes two
                    depth-=2
                    if depth<=0: break
                elif c.k=='EOF': break
    def skip_type(s):
        # consume a type expression up to a delimiter at depth 0
        depth=0
        STOP_OP={',',')',']','}',';','='}
        STOP_KW={'then','do','end','else','elseif','until','return','local','if','while','for','function','repeat','break','continue','in'}
        while True:
            c=s.cur()
            if c.k=='EOF': return
            if c.k=='OP':
                if c.v in '([{' : depth+=1; s.nx(); continue
                if c.v in ')]}':
                    if depth==0: return
                    depth-=1; s.nx(); continue
                if c.v=='<': depth+=1; s.nx(); continue
                if c.v=='>':
                    if depth>0: depth-=1
                    s.nx(); continue
                if c.v=='>>':
                    if depth>0: depth=max(0,depth-2)
                    s.nx(); continue
                if depth==0 and c.v in STOP_OP: return
                s.nx(); continue
            if c.k=='KW' and depth==0 and c.v in STOP_KW: return
            s.nx()

    # ---------- expressions ----------
    def primary(s):
        c=s.cur()
        if c.k=='OP' and c.v=='(':
            s.nx(); e=s.expr(); s.expectv(')'); return ('paren', e)
        if c.k=='NAME':
            s.nx(); return ('name', c.v)
        raise SyntaxError(f"unexpected {c.k} {c.v!r} at {c.i}")
    def suffixed(s):
        e=s.primary()
        while True:
            c=s.cur()
            if c.k=='OP' and c.v=='.':
                s.nx(); nm=s.expect('NAME').v; e=('index', e, ('str', nm.encode()))
            elif c.k=='OP' and c.v=='[':
                s.nx(); k=s.expr(); s.expectv(']'); e=('index', e, k)
            elif c.k=='OP' and c.v==':':
                s.nx(); nm=s.expect('NAME').v; args=s.callargs(); e=('method', e, nm, args)
            elif c.k=='OP' and c.v=='(':
                args=s.callargs(); e=('call', e, args)
            elif c.k=='STR':
                e=('call', e, [('str', decode_str(s.nx().v))])
            elif c.k=='OP' and c.v=='{':
                e=('call', e, [s.table()])
            else:
                break
        return e
    def callargs(s):
        c=s.cur()
        if c.k=='STR': return [('str', decode_str(s.nx().v))]
        if c.k=='OP' and c.v=='{': return [s.table()]
        s.expectv('('); args=[]
        if not s.atv(')'):
            args.append(s.expr())
            while s.accept('OP',','): args.append(s.expr())
        s.expectv(')'); return args
    def table(s):
        s.expectv('{'); fields=[]
        while not s.atv('}'):
            c=s.cur()
            if c.k=='OP' and c.v=='[':
                s.nx(); k=s.expr(); s.expectv(']'); s.expectv('='); v=s.expr(); fields.append(('kv',k,v))
            elif c.k=='NAME' and s.t[s.i+1].k=='OP' and s.t[s.i+1].v=='=':
                nm=s.nx().v; s.nx(); v=s.expr(); fields.append(('kv',('str',nm.encode()),v))
            else:
                fields.append(('item', s.expr()))
            if not (s.accept('OP',',') or s.accept('OP',';')): break
        s.expectv('}'); return ('table', fields)
    def funcbody(s, implicit_self=False):
        s.expectv('('); params=[]; vararg=False
        if implicit_self: params.append('self')
        if not s.atv(')'):
            while True:
                if s.atv('...'): s.nx(); vararg=True; break
                pn=s.expect('NAME').v; params.append(pn)
                if s.accept('OP',':'): s.skip_type()
                if not s.accept('OP',','): break
        s.expectv(')')
        if s.accept('OP',':'): s.skip_type()  # return type
        body=s.block(); s.expect('KW','end')
        return ('func', params, vararg, body)
    def simple(s):
        c=s.cur()
        if c.k=='NUM': s.nx(); return ('num', parse_num(c.v))
        if c.k=='STR': s.nx(); return ('str', decode_str(c.v))
        if c.k=='INTERP': s.nx(); return s.interp(c.v)
        if c.k=='KW' and c.v=='nil': s.nx(); return ('nil',)
        if c.k=='KW' and c.v=='true': s.nx(); return ('true',)
        if c.k=='KW' and c.v=='false': s.nx(); return ('false',)
        if c.k=='OP' and c.v=='...': s.nx(); return ('vararg',)
        if c.k=='OP' and c.v=='{': return s.table()
        if c.k=='KW' and c.v=='function': s.nx(); return s.funcbody()
        if c.k=='KW' and c.v=='if': return s.ifexpr()
        return s.suffixed()
    def ifexpr(s):
        s.expect('KW','if'); cond=s.expr(); s.expect('KW','then'); a=s.expr()
        elifs=[]
        while s.at('KW','elseif'):
            s.nx(); ec=s.expr(); s.expect('KW','then'); ev=s.expr(); elifs.append((ec,ev))
        s.expect('KW','else'); b=s.expr()
        node=b
        for ec,ev in reversed(elifs): node=('ifexpr',ec,ev,node)
        return ('ifexpr',cond,a,node)
    def interp(s, raw):
        # `...{expr}...` -> ('interp', [bytes|expr,...])
        body=raw[1:-1]; parts=[]; i=0; cur=bytearray()
        while i<len(body):
            ch=body[i]
            if ch=='\\' and i+1<len(body):
                d=body[i+1]
                cur.append(_ESC.get(d, ord(d))); i+=2; continue
            if ch=='{':
                depth=1; j=i+1
                while j<len(body) and depth>0:
                    if body[j]=='{': depth+=1
                    elif body[j]=='}': depth-=1
                    if depth==0: break
                    j+=1
                if cur: parts.append(bytes(cur)); cur=bytearray()
                sub=body[i+1:j]
                subtoks=lex(sub); parts.append(P(subtoks).expr())
                i=j+1; continue
            cur+=ch.encode('utf-8'); i+=1
        if cur: parts.append(bytes(cur))
        return ('interp', parts)
    UNOP={'not','-','#','~'}
    def unary(s):
        c=s.cur()
        if (c.k=='KW' and c.v=='not') or (c.k=='OP' and c.v in ('-','#','~')):
            s.nx(); e=s.unary(); node=('unop', c.v, e)
        else:
            node=s.simple()
        while s.atv('::'):
            s.nx(); s.skip_type()  # cast erased
        return node
    # binary precedence (left, right)
    BINPRI={'or':(1,1),'and':(2,2),'<':(3,3),'>':(3,3),'<=':(3,3),'>=':(3,3),'~=':(3,3),'==':(3,3),
            '|':(4,4),'~':(5,5),'&':(6,6),'<<':(7,7),'>>':(7,7),'..':(9,8),'+':(10,10),'-':(10,10),
            '*':(11,11),'/':(11,11),'//':(11,11),'%':(11,11),'^':(14,13)}
    def expr(s, limit=0):
        e=s.unary()
        while True:
            c=s.cur()
            op=c.v if (c.k=='OP' or c.k=='KW') else None
            if op not in s.BINPRI: break
            lp,rp=s.BINPRI[op]
            if lp<=limit: break
            s.nx(); rhs=s.expr(rp)
            if op=='and': e=('and',e,rhs)
            elif op=='or': e=('or',e,rhs)
            else: e=('binop',op,e,rhs)
        return e

    # ---------- statements ----------
    def block(s):
        stmts=[]
        while True:
            c=s.cur()
            if c.k=='EOF': break
            if c.k=='KW' and c.v in ('end','else','elseif','until'): break
            if c.k=='KW' and c.v=='return':
                s.nx(); exprs=[]
                cc=s.cur()
                if not (cc.k=='EOF' or (cc.k=='KW' and cc.v in ('end','else','elseif','until')) or (cc.k=='OP' and cc.v==';')):
                    exprs.append(s.expr())
                    while s.accept('OP',','): exprs.append(s.expr())
                s.accept('OP',';')
                stmts.append(('return', exprs)); break
            st=s.statement()
            if st is not None: stmts.append(st)
        return stmts
    def statement(s):
        c=s.cur()
        if c.k=='OP' and c.v==';': s.nx(); return None
        if c.k=='OP' and c.v=='::':
            s.nx(); nm=s.expect('NAME').v; s.expectv('::'); return ('label', nm)
        if c.k=='KW':
            v=c.v
            if v=='local': return s.local_stmt()
            if v=='if': return s.if_stmt()
            if v=='while': s.nx(); cond=s.expr(); s.expect('KW','do'); b=s.block(); s.expect('KW','end'); return ('while',cond,b)
            if v=='for': return s.for_stmt()
            if v=='repeat': s.nx(); b=s.block(); s.expect('KW','until'); cond=s.expr(); return ('repeat',b,cond)
            if v=='do': s.nx(); b=s.block(); s.expect('KW','end'); return ('do',b)
            if v=='function': return s.funcstat()
            if v=='break': s.nx(); return ('break',)
            if v=='continue': s.nx(); return ('continue',)
        # contextual: type alias  /  goto
        if c.k=='NAME' and c.v=='type' and s.t[s.i+1].k=='NAME':
            s.nx(); s.expect('NAME'); s.skip_generics(); s.expectv('='); s.skip_type(); return None
        if c.k=='NAME' and c.v=='export' and s.t[s.i+1].k=='NAME' and s.t[s.i+1].v=='type':
            s.nx(); s.nx(); s.expect('NAME'); s.skip_generics(); s.expectv('='); s.skip_type(); return None
        if c.k=='NAME' and c.v=='goto':
            tgt=s.nx() and s.expect('NAME').v; return ('goto', tgt)
        # expression statement: call or assignment
        e=s.suffixed()
        cc=s.cur()
        if cc.k=='OP' and cc.v in ('=',',') :
            targets=[e]
            while s.accept('OP',','): targets.append(s.suffixed())
            s.expectv('='); exprs=[s.expr()]
            while s.accept('OP',','): exprs.append(s.expr())
            return ('assign', targets, exprs)
        if cc.k=='OP' and cc.v in ('+=','-=','*=','/=','//=','%=','^=','..='):
            s.nx(); rhs=s.expr(); return ('compound', cc.v[:-1], e, rhs)
        if e[0] in ('call','method'): return ('callstat', e)
        raise SyntaxError(f"unexpected statement near {cc.k} {cc.v!r} at {cc.i}")
    def local_stmt(s):
        s.expect('KW','local')
        if s.at('KW','function'):
            s.nx(); nm=s.expect('NAME').v; fn=s.funcbody(); return ('localfunc', nm, fn)
        names=[]; attribs=[]
        while True:
            nm=s.expect('NAME').v; names.append(nm)
            if s.accept('OP','<'):  # attribute <const>/<close>
                s.expect('NAME'); s.expectv('>')
            if s.accept('OP',':'): s.skip_type()
            if not s.accept('OP',','): break
        exprs=[]
        if s.accept('OP','='):
            exprs.append(s.expr())
            while s.accept('OP',','): exprs.append(s.expr())
        return ('local', names, exprs)
    def if_stmt(s):
        s.expect('KW','if'); arms=[]
        cond=s.expr(); s.expect('KW','then'); b=s.block(); arms.append((cond,b))
        while s.at('KW','elseif'):
            s.nx(); ec=s.expr(); s.expect('KW','then'); eb=s.block(); arms.append((ec,eb))
        els=None
        if s.accept('KW','else'): els=s.block()
        s.expect('KW','end'); return ('if', arms, els)
    def for_stmt(s):
        s.expect('KW','for'); n1=s.expect('NAME').v
        if s.accept('OP','='):
            e1=s.expr(); s.expectv(','); e2=s.expr(); e3=None
            if s.accept('OP',','): e3=s.expr()
            s.expect('KW','do'); b=s.block(); s.expect('KW','end'); return ('fornum',n1,e1,e2,e3,b)
        names=[n1]
        if s.accept('OP',':'): s.skip_type()
        while s.accept('OP',','):
            names.append(s.expect('NAME').v)
            if s.accept('OP',':'): s.skip_type()
        s.expect('KW','in'); exprs=[s.expr()]
        while s.accept('OP',','): exprs.append(s.expr())
        s.expect('KW','do'); b=s.block(); s.expect('KW','end'); return ('forin',names,exprs,b)
    def funcstat(s):
        s.expect('KW','function')
        target=('name', s.expect('NAME').v); is_method=False
        while s.accept('OP','.'):
            target=('index', target, ('str', s.expect('NAME').v.encode()))
        if s.accept('OP',':'):
            target=('index', target, ('str', s.expect('NAME').v.encode())); is_method=True
        fn=s.funcbody(implicit_self=is_method)
        return ('assign', [target], [fn])

def parse(src):
    toks=lex(src)
    p=P(toks)
    blk=p.block()
    if p.cur().k!='EOF':
        c=p.cur(); raise SyntaxError(f"trailing tokens at {c.i}: {c.k} {c.v!r}")
    return ('chunk', blk)

if __name__=='__main__':
    import sys
    ast=parse(open(sys.argv[1]).read())
    print("parsed OK, top-level statements:", len(ast[1]))
