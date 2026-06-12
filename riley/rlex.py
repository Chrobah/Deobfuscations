# Luau lexer -> clean token stream (no WS/comments), with kinds for the parser.
KEYWORDS = set("and break do else elseif end false for function if in local nil not or repeat return then true until while continue".split())
# note: type/export/continue are contextual in Luau; we treat 'continue' as keyword-ish, 'type'/'export' as names.

class Tok:
    __slots__=('k','v','i')
    def __init__(s,k,v,i): s.k=k; s.v=v; s.i=i
    def __repr__(s): return f"{s.k}:{s.v!r}"

def lex(src):
    toks=[]; i=0; n=len(src)
    def longbr(j):
        if src[j] != '[': return None
        k=j+1; lvl=0
        while k<n and src[k]=='=': lvl+=1; k+=1
        if k<n and src[k]=='[': return (lvl,k+1)
        return None
    while i<n:
        c=src[i]
        if c in ' \t\r\n': i+=1; continue
        if c=='-' and i+1<n and src[i+1]=='-':
            lb=longbr(i+2)
            if lb:
                lvl,st=lb; close=']'+'='*lvl+']'; e=src.find(close,st); i=(e+len(close)) if e!=-1 else n
            else:
                j=i
                while j<n and src[j]!='\n': j+=1
                i=j
            continue
        lb=longbr(i)
        if lb:
            lvl,st=lb; close=']'+'='*lvl+']'; e=src.find(close,st)
            body_end=e if e!=-1 else n
            body=src[st:body_end]
            if body.startswith('\r\n'): body=body[2:]
            elif body[:1] in ('\n','\r'): body=body[1:]
            toks.append(Tok('STR', ('long', body), i)); i=(e+len(close)) if e!=-1 else n; continue
        if c=='"' or c=="'":
            j=i+1
            while j<n:
                if src[j]=='\\': j+=2; continue
                if src[j]==c: j+=1; break
                if src[j]=='\n': break
                j+=1
            toks.append(Tok('STR', ('q', src[i:j]), i)); i=j; continue
        if c=='`':
            j=i+1; depth=0
            while j<n:
                if src[j]=='\\': j+=2; continue
                if src[j]=='{': depth+=1; j+=1; continue
                if src[j]=='}' and depth>0: depth-=1; j+=1; continue
                if src[j]=='`' and depth==0: j+=1; break
                j+=1
            toks.append(Tok('INTERP', src[i:j], i)); i=j; continue
        if c.isdigit() or (c=='.' and i+1<n and src[i+1].isdigit()):
            j=i
            if c=='0' and i+1<n and src[i+1] in 'xX':
                j=i+2
                while j<n and (src[j] in '0123456789abcdefABCDEF_.pP' or (src[j] in '+-' and src[j-1] in 'pP')): j+=1
            elif c=='0' and i+1<n and src[i+1] in 'bB':
                j=i+2
                while j<n and src[j] in '01_': j+=1
            else:
                while j<n and (src[j].isdigit() or src[j] in '._eE' or (src[j] in '+-' and src[j-1] in 'eE')): j+=1
            toks.append(Tok('NUM', src[i:j], i)); i=j; continue
        if c.isalpha() or c=='_':
            j=i
            while j<n and (src[j].isalnum() or src[j]=='_'): j+=1
            w=src[i:j]
            toks.append(Tok('KW' if w in KEYWORDS else 'NAME', w, i)); i=j; continue
        for op in ('...','..=','//=','//','<<','>>','==','~=','<=','>=','..','::','+=','-=','*=','/=','%=','^=','->'):
            if src.startswith(op,i): toks.append(Tok('OP',op,i)); i+=len(op); break
        else:
            toks.append(Tok('OP',c,i)); i+=1
    toks.append(Tok('EOF',None,n))
    return toks
