import re, struct, sys

def unpack(path):
    t = open(path).read()
    blob = re.search(r'\[=\[(.*?)\]=\]', t, re.S).group(1)
    blob = blob[4:].replace('z', '!!!!!')          # string.sub(blob,5); Ascii85 'z' shorthand
    a85 = bytearray()
    for i in range(0, len(blob) - len(blob) % 5, 5):
        v = 0
        for c in blob[i:i+5]:
            v = v * 85 + (ord(c) - 33)
        a85 += struct.pack('>I', v & 0xFFFFFFFF)

    data = bytes(a85)
    Y = [1 << i for i in range(33)]
    ptr = [0]
    def rd():
        ptr[0] += 1
        i = ptr[0] - 1
        return data[i] if i < len(data) else 0
    V = len(data)
    code = 0
    for _ in range(5):
        code = code * 256 + rd()
    rng = 0xFFFFFFFF
    state = {'code': code, 'rng': rng}
    def rcDirect(nbits):
        y = 0
        for _ in range(nbits):
            state['rng'] //= 2
            y *= 2
            if not (state['code'] < state['rng']):
                state['code'] -= state['rng']; y += 1
            if state['rng'] <= 0x00FFFFFF:
                state['rng'] *= 256; state['code'] = state['code'] * 256 + rd()
        return y
    def rcBit(probs, idx):
        prob = probs.get(idx, 1024)
        bound = (state['rng'] // 2048) * prob
        if state['code'] < bound:
            state['rng'] = bound; prob += (2048 - prob) // 32; bit = 0
        else:
            state['rng'] -= bound; state['code'] -= bound; prob -= prob // 32; bit = 1
        probs[idx] = prob
        if state['rng'] <= 0x00FFFFFF:
            state['rng'] *= 256; state['code'] = state['code'] * 256 + rd()
        return bit
    def rcTree(probs, nbits, offset):
        m = 1
        for _ in range(nbits): m = m * 2 + rcBit(probs, m)
        return m - offset
    def rcRevTree(probs, idx0, nbits):
        res = 0; k = 1
        for L in range(nbits):
            b = rcBit(probs, idx0 + k); k = k * 2 + b; res += b * Y[L]
        return res
    def rcMatched(probs, matchByte):
        o = 1
        for kk in range(7, -1, -1):
            Lb = (matchByte // Y[kk]) % 2
            d = rcBit(probs, o + (Lb * 256) + 256); o = o * 2 + d
            if Lb != d:
                while o < 0x100: o = o * 2 + rcBit(probs, o)
                break
        return o % 256
    S  = lambda n: {i: 1024 for i in range(n)}
    T  = lambda r, l: {h: {c: 1024 for c in range(l)} for h in range(r)}
    RC = lambda: {1: 1024, 2: 1024, 3: T(1, 8), 4: T(1, 8), 5: S(256)}
    def rcLen(LC, ps):
        if rcBit(LC, 1) == 0: return rcTree(LC[3][ps], 3, 8)
        if rcBit(LC, 2) == 0: return 8 + rcTree(LC[4][ps], 3, 8)
        return rcTree(LC[5], 8, 256) + 16
    U, h, M, u, c, E, m = T(8, 0x300), T(12, 1), S(12), S(12), S(12), S(12), T(12, 1)
    v, X, s, Z, R = T(4, 64), S(115), S(16), RC(), RC()
    K = _ = p = d = 0
    D = 0; o = {0: 0}; k = 0
    L = {0:0,1:0,2:0,3:0,4:1,5:2,6:3,7:4,8:5,9:6,10:4,11:5}
    while ptr[0] <= V:
        ps = D % 1
        if rcBit(h[k], ps) == 0:
            prev = o[D]; row = prev // Y[5]; D += 1
            o[D] = rcTree(U[row], 8, 256) if k < 7 else rcMatched(U[row], o[D - K - 1])
            k = L[k]
        else:
            n = None
            if rcBit(M, k) != 0:
                if rcBit(u, k) == 0:
                    if rcBit(m[k], ps) == 0:
                        k = 9 if k < 7 else 11; n = 1
                else:
                    if rcBit(c, k) == 0: Bb = _
                    else:
                        if rcBit(E, k) == 0: Bb = p
                        else: Bb = d; d = p
                        p = _
                    _ = K; K = Bb
                if n is None:
                    k = 8 if k < 7 else 11; n = 2 + rcLen(R, ps)
            else:
                d = p; p = _; _ = K; n = 2 + rcLen(Z, ps)
                ls = n - 2;  ls = 3 if ls >= 4 else ls
                K = rcTree(v[ls], 6, 64)
                if K >= 4:
                    ps2 = K; nd = ps2 // 2 - 1; K = (2 + ps2 % 2) * Y[nd]
                    if ps2 < 14:
                        K += rcRevTree(X, K - ps2, nd)
                    else:
                        K += rcDirect(nd - 4) * 16 + rcRevTree(s, 0, 4)
                        if K == 0xFFFFFFFF: break
                k = 7 if k < 7 else 10
                if K >= D: break
            H2 = D + n
            for V2 in range(D + 1, H2 + 1): o[V2] = o[V2 - K - 1]
            D = H2
    return bytes(o[i] & 0xFF for i in range(1, D + 1))

if __name__ == '__main__':
    src = sys.argv[1] if len(sys.argv) > 1 else 'GrowAGarden.luraph-payload.lua'
    out = unpack(src)
    sys.stdout.buffer.write(out)
