# Control-flow scrambling pass over the compiled bytecode.
# Inserts opaque-predicate-guarded DEAD branches + side-effect-free junk statements,
# and recurses into every nested block. All injected code is behaviour-neutral:
#  - junk statements are junk-local declarations of pure arithmetic (safe even if run)
#  - opaque-FALSE branches never execute; opaque-TRUE branches only run more junk
import rcompile as C

def scramble(prog, rng, intensity=1.0):
    jv=[1_000_000]
    def jvid(): jv[0]+=1; return jv[0]
    def jconst():
        b=('j'+format(rng.randrange(1<<28),'x')).encode()
        prog['consts'].append(b); return len(prog['consts'])
    def jexpr(d=0):
        # numeric-only and side-effect-free: never errors even if executed
        if d>=2 or rng.random()<0.5: return [C.NUM, rng.randrange(1,99999)]
        return [C.BINOP, rng.choice([1,2,3]), jexpr(d+1), jexpr(d+1)]  # + - *
    def jstmt(): return [C.LOCALDECL, [jvid()], [jexpr()]]
    def opaque_true():
        # #"<nonempty>" > 0   (always true; analyzer must evaluate the string length)
        return [C.BINOP, C.BINOPS['>'], [C.UNOP, C.UNOPS['#'], [C.STR, jconst()]], [C.NUM, 0]]
    def opaque_false():
        return [C.UNOP, C.UNOPS['not'], opaque_true()]
    def deadblk(): return [jstmt() for _ in range(rng.randint(1,3))]
    TERM={C.RETURN, C.BREAK, C.CONTINUE}

    def rec(st):
        op=st[0]
        if op==C.DO: return [C.DO, sblk(st[1])]
        if op==C.WHILE: return [C.WHILE, st[1], sblk(st[2])]
        if op==C.REPEAT: return [C.REPEAT, sblk(st[1]), st[2]]
        if op==C.IF:
            arms=[[c, sblk(b)] for c,b in st[1]]
            els=sblk(st[2]) if st[2]!=0 else 0
            return [C.IF, arms, els]
        if op==C.FORNUM: return [C.FORNUM, st[1],st[2],st[3],st[4], sblk(st[5])]
        if op==C.FORIN: return [C.FORIN, st[1],st[2], sblk(st[3])]
        return st
    def sblk(block):
        out=[]
        for st in block:
            if rng.random()<0.35*intensity: out.append(jstmt())
            if rng.random()<0.30*intensity: out.append([C.IF, [[opaque_false(), deadblk()]], 0])
            st=rec(st)
            out.append(st)
            if st[0] in TERM: continue
            if rng.random()<0.25*intensity:
                out.append([C.IF, [[opaque_true(), deadblk()]], deadblk()])
        return out
    for p in prog['protos']:
        p['body']=sblk(p['body'])
    return prog
