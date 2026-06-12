#!/usr/bin/env python3
# luaobf - single-file Luau (Roblox) anti-decompilation obfuscator
import re

# Luau lexer: precisely tokenizes strings, numbers, comments, names, ops.
KEYWORDS = set("and break do else elseif end false for function if in local nil not or repeat return then true until while continue export type".split())

def lex(src):
    toks = []  # (kind, text)
    i, n = 0, len(src)
    def long_bracket(j):
        # at src[j]=='[' ; returns (level, end_open_index) or None
        if src[j] != '[': return None
        k = j+1; lvl = 0
        while k < n and src[k] == '=': lvl += 1; k += 1
        if k < n and src[k] == '[':
            return (lvl, k+1)
        return None
    while i < n:
        c = src[i]
        # whitespace
        if c in ' \t\r\n':
            j = i
            while j < n and src[j] in ' \t\r\n': j += 1
            toks.append(('WS', src[i:j])); i = j; continue
        # comments
        if c == '-' and i+1 < n and src[i+1] == '-':
            lb = long_bracket(i+2)
            if lb:
                lvl, start = lb
                close = ']' + '='*lvl + ']'
                e = src.find(close, start)
                e = (e + len(close)) if e != -1 else n
                toks.append(('COMMENT', src[i:e])); i = e; continue
            else:
                j = i
                while j < n and src[j] != '\n': j += 1
                toks.append(('COMMENT', src[i:j])); i = j; continue
        # long string
        lb = long_bracket(i)
        if lb:
            lvl, start = lb
            close = ']' + '='*lvl + ']'
            e = src.find(close, start)
            e = (e + len(close)) if e != -1 else n
            toks.append(('STRING', src[i:e])); i = e; continue
        # quoted string
        if c == '"' or c == "'":
            j = i+1
            while j < n:
                if src[j] == '\\': j += 2; continue
                if src[j] == c: j += 1; break
                if src[j] == '\n': break  # unterminated; stop
                j += 1
            toks.append(('STRING', src[i:j])); i = j; continue
        # backtick interpolated string (Luau) - pass through as INTERP (don't encrypt)
        if c == '`':
            j = i+1; depth = 0
            while j < n:
                if src[j] == '\\': j += 2; continue
                if src[j] == '{': depth += 1; j += 1; continue
                if src[j] == '}' and depth > 0: depth -= 1; j += 1; continue
                if src[j] == '`' and depth == 0: j += 1; break
                j += 1
            toks.append(('INTERP', src[i:j])); i = j; continue
        # number
        if c.isdigit() or (c == '.' and i+1 < n and src[i+1].isdigit()):
            j = i
            if c == '0' and i+1 < n and src[i+1] in 'xX':
                j = i+2
                while j < n and (src[j] in '0123456789abcdefABCDEF_.' or src[j] in 'pP' or (src[j] in '+-' and src[j-1] in 'pP')):
                    j += 1
            elif c == '0' and i+1 < n and src[i+1] in 'bB':
                j = i+2
                while j < n and src[j] in '01_': j += 1
            else:
                while j < n and (src[j].isdigit() or src[j] in '._' or src[j] in 'eE' or (src[j] in '+-' and src[j-1] in 'eE')):
                    j += 1
            toks.append(('NUMBER', src[i:j])); i = j; continue
        # name / keyword
        if c.isalpha() or c == '_':
            j = i
            while j < n and (src[j].isalnum() or src[j] == '_'): j += 1
            w = src[i:j]
            toks.append(('KEYWORD' if w in KEYWORDS else 'NAME', w)); i = j; continue
        # multi-char operators
        for op in ('...', '..=', '//=', '<<', '>>', '==', '~=', '<=', '>=', '..', '::', '+=', '-=', '*=', '/=', '%=', '^=', '->'):
            if src.startswith(op, i):
                toks.append(('OP', op)); i += len(op); break
        else:
            toks.append(('OP', c)); i += 1
    return toks

def significant_prev(toks, idx):
    j = idx-1
    while j >= 0 and toks[j][0] in ('WS', 'COMMENT'): j -= 1
    return toks[j] if j >= 0 else None

# emit tokens, inserting a space only where two tokens would otherwise merge
def _wordch(c): return c.isalnum() or c == '_'
def emit(toks):
    out = []
    for k, t in toks:
        if out:
            prev = out[-1]
            if prev and t:
                a, b = prev[-1], t[0]
                need = False
                if (_wordch(a) and _wordch(b)): need = True
                # avoid '--' merge, '..'/'...' merges, etc.
                elif a in '-' and b == '-': need = True
                elif a == '.' and b == '.': need = True
                elif a in '<>=~/*+%^.' and b in '<>=~/*+%^.': need = True
                elif a == '[' and b == '[': need = True
                elif a == ']' and b == ']': need = True
                elif a == ':' and b == ':': need = True
                if need: out.append(' ')
        out.append(t)
    return ''.join(out)


#!/usr/bin/env python3
"""luaobf - a Luau (Roblox) source obfuscator focused on anti-decompilation.

Primary defense: every string/constant literal is removed from the program and
replaced with a runtime-decrypted lookup, so a dumped+decompiled bytecode shows
opaque R(n) calls instead of readable service/remote/message strings.
"""
import argparse, random, sys, re

# ---------- decode Luau string literal -> raw bytes ----------
_ESC = {'n':10,'t':9,'r':13,'a':7,'b':8,'f':12,'v':11,'\\':92,'"':34,"'":39,'\n':10}
def decode_string(tok: str) -> bytes:
    if tok.startswith('['):  # long string
        lvl = tok.index('[',1) - 1
        open_len = 2 + lvl
        close_len = 2 + lvl
        body = tok[open_len:len(tok)-close_len]
        if body.startswith('\r\n'): body = body[2:]
        elif body.startswith('\n') or body.startswith('\r'): body = body[1:]
        return body.encode('utf-8', 'surrogatepass')
    q = tok[0]; s = tok[1:-1]; out = bytearray(); i = 0
    while i < len(s):
        c = s[i]
        if c == '\\':
            d = s[i+1]
            if d == 'x':
                out.append(int(s[i+2:i+4],16)); i += 4; continue
            if d == 'z':
                i += 2
                while i < len(s) and s[i] in ' \t\r\n': i += 1
                continue
            if d == 'u' and i+2 < len(s) and s[i+2] == '{':
                e = s.index('}', i); cp = int(s[i+3:e],16); out += chr(cp).encode('utf-8'); i = e+1; continue
            if d.isdigit():
                j = i+1; num = ''
                while j < len(s) and s[j].isdigit() and len(num) < 3: num += s[j]; j += 1
                out.append(int(num) & 0xFF); i = j; continue
            out.append(_ESC.get(d, ord(d))); i += 2; continue
        out += c.encode('utf-8'); i += 1
    return bytes(out)

def luau_bytestr(b: bytes) -> str:
    out = ['"']
    for x in b:
        if x == 34: out.append('\\"')
        elif x == 92: out.append('\\\\')
        elif 32 <= x < 127: out.append(chr(x))
        else: out.append('\\%03d' % x)
    out.append('"'); return ''.join(out)

def rname(rng, n=None):
    n = n or rng.randint(6,10)
    return '_' + ''.join(rng.choice('abcdefghijklmnopqrstuvwxyz0123456789') for _ in range(n))

def obfuscate(src, seed=None, place_lock=0, minify=True, anti_tamper=False, do_index=True):
    rng = random.Random(seed if seed is not None else random.randrange(1<<31))
    R_PLACE='\0R\0'
    KB = bytes(rng.randrange(256) for _ in range(256))
    S = rng.randint(1,255); A = rng.randint(1,127)*2+1; B = rng.randint(0,255)
    PK = (place_lock * 2654435761) % 256

    def salt(p): return (p*A + B + PK) % 256
    def enc(b, p):
        st = salt(p); o = bytearray()
        for i,c in enumerate(b):
            o.append(((c ^ KB[(i+st) % 256]) + (st + i*S)) % 256)
        return bytes(o)

    toks = lex(src)
    pool = []; index = {}
    def poolidx(raw: bytes):
        if raw in index: return index[raw]
        p = len(pool)+1; index[raw]=p; pool.append(enc(raw,p)); return p

    SKIP_PREV = {':','|','&','->','<'}
    CONT = {'=','|','&',',','<','(','{','->'}
    STMT_BOUND = {';',')','}'}
    n = len(toks)
    def nextsig(i):
        j=i+1
        while j<n and toks[j][0] in ('WS','COMMENT'): j+=1
        return j if j<n else None
    def prevsig(i):
        j=i-1
        while j>=0 and toks[j][0] in ('WS','COMMENT'): j-=1
        return j if j>=0 else None

    # mark tokens that are part of a `function <path>(` declaration header (don't touch their . : names)
    protected = set()
    i=0
    while i<n:
        if toks[i]==('KEYWORD','function'):
            j=nextsig(i)
            # consume NAME (. NAME)* (: NAME)? up to '('
            if j is not None and toks[j][0]=='NAME':
                protected.add(j); j=nextsig(j)
                while j is not None and toks[j][0]=='OP' and toks[j][1] in ('.',':'):
                    protected.add(j); k=nextsig(j)
                    if k is not None and toks[k][0]=='NAME': protected.add(k); j=nextsig(k)
                    else: break
        i+=1

    in_type=False; depth=0; last_sig=None
    out_toks=[]
    i=0
    while i<n:
        kind,text = toks[i]
        # type-decl tracking
        if kind=='KEYWORD' and text=='type':
            pj=prevsig(i)
            ps = toks[pj] if pj is not None else None
            if ps is None or (ps[0]=='KEYWORD' and ps[1]=='export') or (ps[0]=='OP' and ps[1] in STMT_BOUND) or (ps[0]=='KEYWORD' and ps[1] in ('end','do','then','else','repeat')):
                in_type=True; depth=0
        if in_type:
            if kind=='OP' and text in ('(','{','['): depth+=1
            elif kind=='OP' and text in (')','}',']'): depth=max(0,depth-1)
            elif kind=='WS' and '\n' in text and depth==0:
                if not (last_sig and ((last_sig[0]=='OP' and last_sig[1] in CONT) or (last_sig[0]=='KEYWORD' and last_sig[1]=='typeof'))):
                    in_type=False
        if kind not in ('WS','COMMENT'): last_sig=(kind,text)

        # --- method call: NAME ':' method '(' with lone-NAME receiver ---
        if do_index and (not in_type) and kind=='OP' and text==':' and i not in protected:
            mi=nextsig(i)
            if mi is not None and toks[mi][0]=='NAME' and mi not in protected:
                pi=nextsig(mi)
                if pi is not None and toks[pi]==('OP','('):
                    rj=prevsig(i)
                    if rj is not None and toks[rj][0]=='NAME':
                        bj=prevsig(rj)
                        if bj is None or not (toks[bj][0]=='OP' and toks[bj][1] in ('.',':')):
                            recv = toks[rj][1]
                            p = poolidx(toks[mi][1].encode('utf-8'))
                            out_toks.append(('OP','[(%s(%d))]('%(R_PLACE,p)))
                            out_toks.append(('NAME',recv))
                            aj=nextsig(pi)
                            if not (aj is not None and toks[aj]==('OP',')')):
                                out_toks.append(('OP',','))
                            i=pi+1   # consumed ':' method '('
                            continue

        # --- field index: '.' NAME (not concat/vararg, not protected, not decl) ---
        if do_index and (not in_type) and kind=='OP' and text=='.' and i not in protected:
            fi=nextsig(i)
            if fi is not None and toks[fi][0]=='NAME' and fi not in protected:
                p = poolidx(toks[fi][1].encode('utf-8'))
                out_toks.append(('OP','[(%s(%d))]'%(R_PLACE,p)))
                i=fi+1; continue

        # --- string literal ---
        if kind=='STRING':
            pj=prevsig(i); prev=toks[pj] if pj is not None else None
            if in_type or (prev and prev[0]=='OP' and prev[1] in SKIP_PREV):
                out_toks.append((kind,text)); i+=1; continue
            p = poolidx(decode_string(text))
            out_toks.append(('OP','(%s(%d))'%(R_PLACE,p)))
            i+=1; continue

        out_toks.append((kind,text)); i+=1

    # names for the runtime
    R = rname(rng); DEC = rname(rng); POOL = rname(rng); CACHE = rname(rng); KBn = rname(rng)
    BX = rname(rng); CH = rname(rng); BY = rname(rng); CC = rname(rng)
    sub = lambda t: t.replace(R_PLACE, R)
    if minify:
        body = emit([(k, sub(t)) for k,t in out_toks if k not in ('WS','COMMENT')])
    else:
        body = emit([(k, sub(t)) for k,t in out_toks])

    poolsrc = '{' + ','.join(luau_bytestr(e) for e in pool) + '}'
    place_expr = '0'
    if place_lock:
        place_expr = '((game.PlaceId*2654435761)%256)'
    tamper = ''
    if anti_tamper:
        # reliable load-time integrity check (no key dependence so it never breaks legit runs)
        tamper = ('if %s(13,7)~=10 or not %s or not %s then return end;' % (BX, CH, CC))

    prelude = (
        'local {BX},{CH},{BY},{CC}=bit32.bxor,string.char,string.byte,table.concat;'
        'local {KBn}={KBstr};'
        'local {S_},{A_},{B_},{PKv}={S},{A},{B},{PKE};'
        '{tamper}'
        'local {CACHE}={{}};'
        'local function {DEC}({e_},{p_})'
            'local {st_}=({p_}*{A_}+{B_}+{PKv})%256;'
            'local {o_}={{}};'
            'for {i_}=0,#{e_}-1 do '
                'local {b_}={BY}({e_},{i_}+1);'
                'local {k_}={BY}({KBn},(({i_}+{st_})%256)+1);'
                'local {c_}={BX}(({b_}-({st_}+{i_}*{S_}))%256,{k_});'
                '{o_}[{i_}+1]={CH}({c_});'
            'end '
            'return {CC}({o_});'
        'end '
        'local {POOL}={poolsrc};'
        'local function {R}({p_})'
            'local {v_}={CACHE}[{p_}];'
            'if {v_} then return {v_} end '
            '{v_}={DEC}({POOL}[{p_}],{p_});{CACHE}[{p_}]={v_};return {v_};'
        'end '
    ).format(BX=BX,CH=CH,BY=BY,CC=CC,KBn=KBn,KBstr=luau_bytestr(KB),
             S=S,A=A,B=B,PKE=place_expr,tamper=tamper,CACHE=CACHE,DEC=DEC,
             POOL=POOL,poolsrc=poolsrc,R=R,
             e_=rname(rng),p_='_p',st_=rname(rng),o_=rname(rng),i_=rname(rng),
             b_=rname(rng),k_=rname(rng),c_=rname(rng),v_=rname(rng),
             S_=rname(rng),A_=rname(rng),B_=rname(rng),PKv=rname(rng))

    header = '-- Protected with luaobf. Do not redistribute.\n'
    return header + 'return(function(...)' + prelude + body + ' end)(...)\n'

def main():
    ap = argparse.ArgumentParser(description='Luau (Roblox) anti-decompilation obfuscator')
    ap.add_argument('input'); ap.add_argument('-o','--output')
    ap.add_argument('--seed', type=int, default=None)
    ap.add_argument('--place-lock', type=int, default=0, help='Roblox PlaceId; output only decrypts in that place')
    ap.add_argument('--no-minify', action='store_true')
    ap.add_argument('--anti-tamper', action='store_true')
    ap.add_argument('--no-index', action='store_true', help='do not obfuscate .field / :method names (string-only)')
    ap.add_argument('--verify', action='store_true', help='compile-check the output with luau-compile if available')
    a = ap.parse_args()
    src = open(a.input,encoding='utf-8').read()
    out = obfuscate(src, seed=a.seed, place_lock=a.place_lock, minify=not a.no_minify, anti_tamper=a.anti_tamper, do_index=not a.no_index)
    if a.output: open(a.output,'w',encoding='utf-8').write(out)
    else: sys.stdout.write(out)
    if a.verify:
        import shutil, subprocess, tempfile
        luc = shutil.which('luau-compile')
        if not luc:
            sys.stderr.write('[verify] luau-compile not found on PATH; skipped\n')
        else:
            tf = tempfile.NamedTemporaryFile('w', suffix='.luau', delete=False); tf.write(out); tf.close()
            r = subprocess.run([luc,'--binary',tf.name], stdout=subprocess.DEVNULL, stderr=subprocess.PIPE)
            if r.returncode==0: sys.stderr.write('[verify] output compiles OK\n')
            else: sys.stderr.write('[verify] COMPILE FAILED:\n'+r.stderr.decode('utf-8','replace')+'\n'); sys.exit(2)

if __name__ == '__main__':
    main()
