# Luarmor V4 — `loader 002c19202c9946e6047b0c6e0ad51f84`

`https://api.luarmor.net/files/v4/loaders/002c19202c9946e6047b0c6e0ad51f84.lua`

| File | Description |
|------|-------------|
| `loader.original.lua` | The loader as served (verbatim). |
| `loader.deob.lua` | Deobfuscated loader (it was essentially plaintext). |

## The protection chain

```
loader (this file)
  • defines global _bsdata0 = { ids, nonces, a 205-byte hex blob, 29/24-byte key material }
  • cache: static_content_130525/init-74c74f95fd0-marbeg.lua  (reused if >2000 bytes)
  • else: game:HttpGet("https://cdn.luarmor.net/v4_init_marbeg.lua")  -> cache it -> run it
        │
        ▼
v4_init_marbeg.lua   ("Luarmor V4 bootstrapper", ~602 KB)
  • served only to a real-executor User-Agent (curl/Roblox-Studio get a 327-byte
    "executor not supported" stub; UA "Roblox/WinInet" gets the real file)
  • global  superflow_bytecode = { ...byte-string arrays... }
  • return({ ...~method table... }):A()(...)
        │  this is Luarmor's "Superflow" VM — same family as Luraph (flattened
        │  method-table dispatch, opaque-arithmetic numeric constants, register VM),
        │  but the bytecode is inline (no Ascii85/LZMA packing) and it has
        │  ACTIVE RUNTIME ANTI-ANALYSIS.
        ▼
key + HWID auth against api.luarmor.net  ->  server decrypts/serves the real script
```

## Status

* **Loader** — fully deobfuscated (`loader.deob.lua`). It only fetches/caches the init
  and passes it `_bsdata0`.
* **Superflow init** — identified and structurally characterized (Luraph-family register VM).
  Unlike Luraph, it is **not** a packed-then-clean VM: running the unpacked VM on the real
  Luau runtime in a stubbed sandbox (the technique that fully cracked the Luraph
  `GrowAGarden` payload) does **not** progress — the VM stalls in pure computation before any
  observable action. That is Luarmor's anti-analysis, purpose-built to defeat exactly this
  kind of dynamic instrumentation. The init compiles fine (~0.03 s) and is valid Luau; it is
  the *runtime* that resists.
* **The actual protected "marbeg" script** — gated behind Luarmor's server-side key + HWID
  system. It is never present in the loader or init; it is decrypted/served by Luarmor's API
  only to a client holding a valid purchased key on a matching HWID. It is therefore not
  recoverable from these files by any client-side analysis.

So Luarmor V4 ≠ Luraph in difficulty: the loader is trivial, but the protection adds active
runtime anti-analysis on top of the VM **and** a server-side key gate, neither of which the
Luraph crack had.
