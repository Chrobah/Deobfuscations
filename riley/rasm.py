# Register-VM compiler: AST -> per-proto register bytecode.
# Model: locals live in CELLS (1-elem tables) at fixed register slots so closures
# can share them uniformly; temporaries are plain values in registers. All computation
# happens on temp registers; locals are accessed via GETLOCAL/SETLOCAL.
from rparse import parse

def _allnames(n, acc):
    if isinstance(n, tuple):
        if n and n[0]=='name': acc.add(n[1])
        for x in n: _allnames(x, acc)
    elif isinstance(n, list):
        for x in n: _allnames(x, acc)

def captured_in(body):
    # names referenced inside ANY function nested in `body` (deep). Over-approximates
    # the set of locals that must be heap-boxed so closures can share them. Safe: boxing
    # an extra local is still correct, just slightly slower.
    acc=set()
    def walk(n):
        if isinstance(n, tuple):
            if n[0]=='func': _allnames(n[3], acc); return
            for x in n: walk(x)
        elif isinstance(n, list):
            for x in n: walk(x)
    walk(body)
    return acc

OPS=['LOADK','LOADN','LOADB','LOADNIL','GETLOCAL','SETLOCAL','NEWLOCAL','GETUPVAL','SETUPVAL',
     'GETGLOBAL','SETGLOBAL','GETTABLE','SETTABLE','NEWTABLE','SETLIST','MOVE',
     'ADD','SUB','MUL','DIV','IDIV','MOD','POW','CONCAT','BAND','BOR','BXOR','SHL','SHR',
     'EQ','NE','LT','LE','NOT','UNM','LEN','BNOT','JMP','JF','JT','CALL','RET','CLOSURE',
     'VARARG','SELF','TEST','ITER']
OP={n:i+1 for i,n in enumerate(OPS)}
ARITH={'+':'ADD','-':'SUB','*':'MUL','/':'DIV','//':'IDIV','%':'MOD','^':'POW','..':'CONCAT',
       '&':'BAND','|':'BOR','~':'BXOR','<<':'SHL','>>':'SHR'}
CMP={'==':'EQ','~=':'NE','<':'LT','<=':'LE'}  # >,>= handled by swap

class Proto:
    def __init__(p, parent):
        p.parent=parent; p.code=[]; p.nreg=0; p.freereg=0
        p.scopes=[{}]      # name -> slot (cells)
        p.upvals=[]        # list of ('local',slot) or ('upval',idx)
        p.upvalmap={}      # name -> upval idx
        p.params=0; p.vararg=False
        p.children=[]      # sub-protos
        p.loops=[]         # stack of (breaks[], continues[], continue_target_label)
        p.cap=set()        # names captured by nested funcs (must be boxed)
        p.boxed={}         # slot -> bool (is this local heap-boxed?)

class Asm:
    def __init__(s):
        s.consts=[]; s.cmap={}; s.protos=[]; s.globals={}
    def k(s,b):
        if isinstance(b,str): b=b.encode()
        if b in s.cmap: return s.cmap[b]
        i=len(s.consts)+1; s.cmap[b]=i; s.consts.append(b); return i

    # ---- register/scope helpers (operate on current proto p) ----
    def reserve(s,p,n=1):
        r=p.freereg; p.freereg+=n
        if p.freereg>p.nreg: p.nreg=p.freereg
        return r
    def emit(s,p,op,*args):
        p.code.append([OP[op]]+list(args)); return len(p.code)-1
    def label(s,p): return len(p.code)
    def patch(s,p,at,target): p.code[at][1]=target   # JMP/JF/JT target is arg index 1
    def patchhere(s,p,at): p.code[at][1]=len(p.code)

    def newlocal(s,p,name):
        slot=s.reserve(p)              # permanent slot for this local
        p.scopes[-1][name]=slot; p.boxed[slot]=(name in p.cap)
        return slot
    def bind_at(s,p,name,slot):        # register a name at an existing slot (no reserve)
        p.scopes[-1][name]=slot; p.boxed[slot]=(name in p.cap)
        if slot+1>p.nreg: p.nreg=slot+1
    # boxed-aware local access (raw MOVE when not captured)
    def get_local(s,p,dst,slot):
        if p.boxed.get(slot): s.emit(p,'GETLOCAL', dst, slot)
        elif dst!=slot: s.emit(p,'MOVE', dst, slot)
    def set_local(s,p,slot,src):
        if p.boxed.get(slot): s.emit(p,'SETLOCAL', slot, src)
        elif slot!=src: s.emit(p,'MOVE', slot, src)
    def init_local(s,p,slot,src):      # initialize a freshly-declared local
        if p.boxed.get(slot): s.emit(p,'NEWLOCAL', slot, src)
        elif slot!=src: s.emit(p,'MOVE', slot, src)
    def resolve_local(s,p,name):
        for sc in reversed(p.scopes):
            if name in sc: return sc[name]
        return None
    def resolve_upval(s,p,name):
        if name in p.upvalmap: return p.upvalmap[name]
        if p.parent is None: return None
        pl=s.resolve_local(p.parent, name)
        if pl is not None:
            idx=len(p.upvals); p.upvals.append(('local',pl)); p.upvalmap[name]=idx; return idx
        pu=s.resolve_upval(p.parent, name)
        if pu is not None:
            idx=len(p.upvals); p.upvals.append(('upval',pu)); p.upvalmap[name]=idx; return idx
        return None

    # ---- expression compile: result into a temp register, return that register ----
    def expr(s,p,e, dst=None):
        t=e[0]
        def out():
            return dst if dst is not None else s.reserve(p)
        if t=='num':
            r=out(); s.emit(p,'LOADN', r, e[1]); return r
        if t=='str':
            r=out(); s.emit(p,'LOADK', r, s.k(e[1])); return r
        if t=='nil': r=out(); s.emit(p,'LOADNIL', r); return r
        if t=='true': r=out(); s.emit(p,'LOADB', r, 1); return r
        if t=='false': r=out(); s.emit(p,'LOADB', r, 0); return r
        if t=='vararg':
            r=out(); s.emit(p,'VARARG', r, 1); return r   # 1 result
        if t=='paren': return s.expr(p, e[1], dst)
        if t=='name':
            sl=s.resolve_local(p, e[1])
            if sl is not None: r=out(); s.get_local(p, r, sl); return r
            ui=s.resolve_upval(p, e[1])
            if ui is not None: r=out(); s.emit(p,'GETUPVAL', r, ui); return r
            s.globals[e[1]]=True; r=out(); s.emit(p,'GETGLOBAL', r, s.k(e[1])); return r
        if t=='index':
            base=p.freereg
            o=s.expr(p, e[1]); kk=s.expr(p, e[2])
            r=dst if dst is not None else base
            s.emit(p,'GETTABLE', r, o, kk); p.freereg=max(r+1, base); 
            p.freereg=(r+1) if dst is None else base
            return r
        if t=='call' or t=='method':
            base=p.freereg
            s.call(p, e, base, 1)        # 1 result into base
            p.freereg=base+1
            if dst is not None and dst!=base:
                s.emit(p,'MOVE', dst, base); p.freereg=base; return dst
            return base
        if t=='func':
            r=out(); s.closure(p, e, r); return r
        if t=='table': return s.table(p, e, dst)
        if t=='binop':
            op=e[1]
            if op in ('>','>='):
                base=p.freereg
                a=s.expr(p, e[2]); b=s.expr(p, e[3])      # evaluate left then right (Lua order)
                r=dst if dst is not None else base
                s.emit(p, 'LT' if op=='>' else 'LE', r, b, a)  # a>b == b<a ; a>=b == b<=a
                p.freereg=r+1; return r
            if op in CMP:
                base=p.freereg; a=s.expr(p,e[2]); b=s.expr(p,e[3]); r=dst if dst is not None else base
                s.emit(p, CMP[op], r, a, b); p.freereg=r+1; return r
            base=p.freereg; a=s.expr(p,e[2]); b=s.expr(p,e[3]); r=dst if dst is not None else base
            s.emit(p, ARITH[op], r, a, b); p.freereg=r+1; return r
        if t=='unop':
            base=p.freereg; a=s.expr(p,e[2]); r=dst if dst is not None else base
            s.emit(p, {'-':'UNM','not':'NOT','#':'LEN','~':'BNOT'}[e[1]], r, a); p.freereg=r+1; return r
        if t=='and' or t=='or':
            r=dst if dst is not None else s.reserve(p)
            s.expr(p, e[1], r)
            j=s.emit(p, 'JF' if t=='and' else 'JT', None, r)
            s.expr(p, e[2], r)
            s.patchhere(p, j)
            p.freereg=max(p.freereg, r+1)
            return r
        if t=='ifexpr':
            r=dst if dst is not None else s.reserve(p)
            s.expr(p, e[1], r)
            jf=s.emit(p,'JF', None, r)
            s.expr(p, e[2], r)
            jend=s.emit(p,'JMP', None)
            s.patchhere(p, jf)
            s.expr(p, e[3], r)
            s.patchhere(p, jend)
            p.freereg=max(p.freereg, r+1); return r
        if t=='interp':
            # desugar a..tostring(b)..c
            node=None
            for part in e[1]:
                if isinstance(part,bytes): pn=('str',part)
                else: pn=('call',('name','tostring'),[part])
                node=pn if node is None else ('binop','..',node,pn)
            return s.expr(p, node if node else ('str',b''), dst)
        raise Exception('expr? '+t)

    # ---- multi-value: evaluate exprs into consecutive regs starting at base; returns (count or -1 multret) ----
    def exprlist(s,p, exprs, base, want=-1):
        # want = number of values needed (fixed), or -1 for open/multret
        n=len(exprs)
        if n==0:
            if want>0:
                for i in range(want): s.emit(p,'LOADNIL', base+i)
                p.freereg=base+want; return want
            p.freereg=base; return 0
        for i in range(n-1):
            s.expr(p, exprs[i], base+i); p.freereg=base+i+1
        last=exprs[n-1]
        if last[0] in ('call','method'):
            if want==-1: s.call(p, last, base+n-1, -1); return -1
            need=want-(n-1); s.call(p, last, base+n-1, need); p.freereg=base+want; return want
        if last[0]=='vararg':
            if want==-1: s.emit(p,'VARARG', base+n-1, -1); return -1
            s.emit(p,'VARARG', base+n-1, want-(n-1)); p.freereg=base+want; return want
        s.expr(p, last, base+n-1); p.freereg=base+n
        if want!=-1 and want>n:
            for i in range(n, want): s.emit(p,'LOADNIL', base+i)
            p.freereg=base+want; return want
        return n

    def call(s,p, e, base, nresults):
        if e[0]=='method':
            o=s.expr(p, e[1], base)          # object in base
            s.emit(p,'SELF', base, base, s.k(e[2]))  # base=method, base+1=self
            p.freereg=base+2
            na=s.exprlist(p, e[3], base+2, want=-1)
            nargs = -1 if na==-1 else na+1   # +self
            s.emit(p,'CALL', base, nargs, nresults)
        else:
            s.expr(p, e[1], base); p.freereg=base+1
            na=s.exprlist(p, e[2], base+1, want=-1)
            nargs = -1 if na==-1 else na
            s.emit(p,'CALL', base, nargs, nresults)
        p.freereg=base+(nresults if nresults>=0 else 1)

    def table(s,p, e, dst):
        r=s.reserve(p)                 # table register
        s.emit(p,'NEWTABLE', r)
        abase=r+1                      # array items go in consecutive regs from here
        nitems=0; last_multret=False; n=len(e[1])
        for i,f in enumerate(e[1]):
            if f[0]=='item':
                slot=abase+nitems; p.freereg=slot
                if i==n-1 and f[1][0] in ('call','method','vararg'):
                    if f[1][0]=='vararg': s.emit(p,'VARARG', slot, -1)
                    else: s.call(p, f[1], slot, -1)
                    last_multret=True; nitems+=1
                else:
                    s.expr(p, f[1], slot); p.freereg=slot+1; nitems+=1
            else:                      # kv: evaluate above pending array items, then restore
                save=abase+nitems; p.freereg=save
                kr=s.expr(p, f[1]); vr=s.expr(p, f[2])
                s.emit(p,'SETTABLE', r, kr, vr); p.freereg=save
        if nitems>0:
            s.emit(p,'SETLIST', r, 1, (-1 if last_multret else nitems), abase)
        p.freereg=r+1
        if dst is not None and dst!=r:
            s.emit(p,'MOVE', dst, r); p.freereg=r; return dst
        return r
    def closure(s,p, e, dst):
        child=Proto(p)
        child.vararg=e[2]; child.params=len(e[1]); child.cap=captured_in(e[3])
        s.protos.append(child); idx=len(s.protos)  # 1-based
        child._index=idx
        for nm in e[1]:
            s.newlocal(child, nm)            # params as local cells
        for st in e[3]:
            s.stmt(child, st)
        s.emit(child,'RET', 0, 0)            # implicit return
        # closure instruction: capture spec from child.upvals
        s.emit(p,'CLOSURE', dst, idx)
        p.freereg=max(p.freereg, dst+1)
        return dst

    # ---- statements / blocks ----
    def block(s,p, stmts):
        p.scopes.append({}); savefree=p.freereg
        for st in stmts: s.stmt(p, st)
        p.scopes.pop(); p.freereg=savefree

    def stmt(s,p, st):
        t=st[0]
        if t=='local':
            base=p.freereg; names=st[1]; nt=len(names)
            s.exprlist(p, st[2], base, want=nt)     # fill base..base+nt-1 (nil-padded)
            for i,nm in enumerate(names):
                s.bind_at(p, nm, base+i)
                s.init_local(p, base+i, base+i)       # box in place if captured, else no-op
            p.freereg=base+nt
            return
        if t=='localfunc':
            slot=s.newlocal(p, st[1])
            if p.boxed.get(slot):
                nr=p.freereg; s.emit(p,'LOADNIL', nr); s.emit(p,'NEWLOCAL', slot, nr)  # empty cell first
                tr=p.freereg; s.closure(p, st[2], tr)                                  # closure captures the cell
                s.emit(p,'SETLOCAL', slot, tr)
            else:
                s.closure(p, st[2], slot)                                              # raw: closure straight into slot
            p.freereg=slot+1
            return
        if t=='assign':
            base=p.freereg; nt=len(st[1])
            s.exprlist(p, st[2], base, want=nt)   # RHS fully evaluated first
            p.freereg=base+nt                     # store temps live above
            for i,tg in enumerate(st[1]): s.store(p, tg, base+i)
            p.freereg=base
            return
        if t=='compound':
            tg=st[2]
            tmp=s.reserve(p)               # reserve temp for current value (advances freereg)
            s.load_lhs(p, tg, tmp)
            rhs=s.expr(p, st[3])           # now lands above tmp
            s.emit(p, ARITH[st[1]], tmp, tmp, rhs)
            s.store(p, tg, tmp)
            p.freereg=tmp
            return
        if t=='callstat':
            base=p.freereg; s.call(p, st[1], base, 0); p.freereg=base; return
        if t=='do': s.block(p, st[1]); return
        if t=='return':
            base=p.freereg
            cnt=s.exprlist(p, st[1], base, want=-1)
            s.emit(p,'RET', base, cnt); p.freereg=base; return
        if t=='break':
            j=s.emit(p,'JMP', None); p.loops[-1][0].append(j); return
        if t=='continue':
            j=s.emit(p,'JMP', None); p.loops[-1][1].append(j); return
        if t=='if': s.if_stmt(p, st); return
        if t=='while': s.while_stmt(p, st); return
        if t=='repeat': s.repeat_stmt(p, st); return
        if t=='fornum': s.fornum(p, st); return
        if t=='forin': s.forin(p, st); return
        if t in ('label','goto'): raise NotImplementedError("riley: goto/labels unsupported")
        raise Exception('stmt? '+t)

    def load_lhs(s,p, tg, dst):
        if tg[0]=='name':
            sl=s.resolve_local(p, tg[1])
            if sl is not None: s.get_local(p, dst, sl); return
            ui=s.resolve_upval(p, tg[1])
            if ui is not None: s.emit(p,'GETUPVAL', dst, ui); return
            s.globals[tg[1]]=True; s.emit(p,'GETGLOBAL', dst, s.k(tg[1])); return
        if tg[0]=='index':
            o=s.expr(p, tg[1]); kk=s.expr(p, tg[2]); s.emit(p,'GETTABLE', dst, o, kk); return
    def store(s,p, tg, src):
        if tg[0]=='name':
            sl=s.resolve_local(p, tg[1])
            if sl is not None: s.set_local(p, sl, src); return
            ui=s.resolve_upval(p, tg[1])
            if ui is not None: s.emit(p,'SETUPVAL', ui, src); return
            s.globals[tg[1]]=True; s.emit(p,'SETGLOBAL', s.k(tg[1]), src); return
        if tg[0]=='index':
            save=p.freereg
            o=s.expr(p, tg[1]); kk=s.expr(p, tg[2]); s.emit(p,'SETTABLE', o, kk, src); p.freereg=save; return

    def if_stmt(s,p, st):
        endjumps=[]
        for cond, body in st[1]:
            cr=p.freereg; s.expr(p, cond, cr); p.freereg=cr
            jf=s.emit(p,'JF', None, cr)
            s.block(p, body)
            endjumps.append(s.emit(p,'JMP', None))
            s.patchhere(p, jf)
        if st[2]: s.block(p, st[2])
        for j in endjumps: s.patchhere(p, j)
    def while_stmt(s,p, st):
        top=s.label(p)
        cr=p.freereg; s.expr(p, st[1], cr); p.freereg=cr
        jf=s.emit(p,'JF', None, cr)
        p.loops.append(([],[],None))
        s.block(p, st[2])
        for c in p.loops[-1][1]: s.patch(p, c, top)   # continue -> retest
        s.emit(p,'JMP', top)
        s.patchhere(p, jf)
        for b in p.loops[-1][0]: s.patchhere(p, b)
        p.loops.pop()
    def repeat_stmt(s,p, st):
        top=s.label(p)
        p.loops.append(([],[],None))
        # repeat body shares scope with until-cond
        p.scopes.append({}); savefree=p.freereg
        for x in st[1]: s.stmt(p, x)
        conttarget=s.label(p)
        for c in p.loops[-1][1]: s.patch(p, c, conttarget)
        cr=p.freereg; s.expr(p, st[2], cr); p.freereg=cr
        s.emit(p,'JF', top, cr)   # if cond false, loop
        p.scopes.pop(); p.freereg=savefree
        for b in p.loops[-1][0]: s.patchhere(p, b)
        p.loops.pop()
    def fornum(s,p, st):
        base=p.freereg
        s.expr(p, st[2], base);   p.freereg=base+1      # control var i at base
        s.expr(p, st[3], base+1); p.freereg=base+2      # limit at base+1
        sr=base+2
        if st[4] is not None: s.expr(p, st[4], sr)      # step at base+2
        else: s.emit(p,'LOADN', sr, 1)
        p.freereg=base+3
        ir=base; lr=base+1
        top=s.label(p)
        c=base+3; z=base+4
        s.emit(p,'LOADN', z, 0)
        spos=base+5; s.emit(p,'LT', spos, z, sr)        # spos = (0 < step)
        js=s.emit(p,'JF', None, spos)                   # step<=0 -> neg branch
        s.emit(p,'LE', c, ir, lr)                       # pos: c = (i <= limit)
        jd=s.emit(p,'JMP', None)
        s.patchhere(p, js); s.emit(p,'LE', c, lr, ir)   # neg: c = (limit <= i)
        s.patchhere(p, jd)
        jf=s.emit(p,'JF', None, c)                      # exit when not c
        p.freereg=base+3
        p.loops.append(([],[],None)); p.scopes.append({})
        slot=s.newlocal(p, st[1]); s.init_local(p, slot, ir)        # fresh loop-var cell if captured
        for x in st[5]: s.stmt(p, x)
        p.scopes.pop(); p.freereg=base+3
        cont=s.label(p)
        for cc in p.loops[-1][1]: s.patch(p, cc, cont)
        s.emit(p,'ADD', ir, ir, sr)                     # i += step
        s.emit(p,'JMP', top)
        s.patchhere(p, jf)
        for b in p.loops[-1][0]: s.patchhere(p, b)
        p.loops.pop(); p.freereg=base
    def forin(s,p, st):
        base=p.freereg
        cnt=s.exprlist(p, st[2], base)   # f, st, ctrl in base,base+1,base+2
        # ensure 3 slots
        fr=base; sr=base+1; ctrl=base+2
        p.freereg=base+3
        s.emit(p,'ITER', base)          # normalize iterator: tables/__iter -> (next,t,nil) (Luau generalized iteration)
        top=s.label(p)
        # call f(st, ctrl) -> results in callbase
        cb=p.freereg
        s.emit(p,'MOVE', cb, fr); s.emit(p,'MOVE', cb+1, sr); s.emit(p,'MOVE', cb+2, ctrl)
        p.freereg=cb+3
        nv=len(st[1])
        s.emit(p,'CALL', cb, 2, nv if nv>0 else 1)
        p.freereg=cb+max(nv,1)
        # if first result nil -> break
        isnil=p.freereg; s.emit(p,'LOADNIL', isnil+0) if False else None
        nilr=p.freereg; s.emit(p,'LOADNIL', nilr)
        eqr=p.freereg+1; s.emit(p,'EQ', eqr, cb, nilr)
        jf=s.emit(p,'JT', None, eqr)   # if cb==nil jump out
        s.emit(p,'MOVE', ctrl, cb)     # ctrl = first result
        p.freereg=cb+nv
        # bind loop vars as fresh cells
        p.loops.append(([],[],None)); p.scopes.append({})
        slots=[]
        for i,nm in enumerate(st[1]):
            slot=s.newlocal(p, nm); s.init_local(p, slot, cb+i)
        savefree=p.freereg
        for x in st[3]: s.stmt(p, x)
        p.scopes.pop(); p.freereg=base+3
        conttarget=s.label(p)
        for c in p.loops[-1][1]: s.patch(p, c, conttarget)
        s.emit(p,'JMP', top)
        s.patchhere(p, jf)
        for b in p.loops[-1][0]: s.patchhere(p, b)
        p.loops.pop(); p.freereg=base

def compile_reg(src):
    a=Asm()
    main=Proto(None); main.vararg=True
    a.protos.append(main); main._index=1
    body=parse(src)[1]; main.cap=captured_in(body)
    a.block(main, body)
    a.emit(main,'RET', 0, 0)
    return {
        'protos':[{'code':p.code,'nreg':p.nreg,'params':p.params,'vararg':p.vararg,'upvals':p.upvals,
                   'boxedp':[bool(p.boxed.get(i)) for i in range(p.params)]} for p in a.protos],
        'consts':a.consts, 'globals':sorted(a.globals), 'OP':OP
    }

if __name__=='__main__':
    import sys
    prog=compile_reg(open(sys.argv[1]).read())
    print("OK protos=%d consts=%d"%(len(prog['protos']),len(prog['consts'])))
    for i,p in enumerate(prog['protos']):
        print(" proto",i+1,"nreg",p['nreg'],"instrs",len(p['code']),"upvals",p['upvals'])
