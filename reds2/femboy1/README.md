# reds2 / femboy1 — `GardenSpawner`

`https://raw.githubusercontent.com/reds2/femboy1/refs/heads/main/GardenSpawner`

A Roblox **Grow a Garden** loader obfuscated with the WeAreDevs (`wearedevs.net/obfuscator`)
VM engine. It is a **webhook stealer**: after an anti-tamper check it sets global
`Username` / `Webhook` and downloads + runs a second stage that exfiltrates with them.

| File | Description |
|------|-------------|
| `GardenSpawner.obfuscated.lua` | Original obfuscated loader (verbatim). |
| `GardenSpawner.deob.lua` | Comment-free reconstruction. |
| `GrowAGarden.luraph-payload.lua` | The stage-2 payload (verbatim). **Protected with Luraph Obfuscator v14.4.1**. |
| `GrowAGarden.unpacker.py` | Self-contained unpacker: reverses Luraph's Ascii85 + custom-LZMA packing of the payload. |
| `GrowAGarden.unpacked-vm.lua` | Output of the unpacker — the 116 KB Luraph register-VM source (still virtualized). |

## Luraph v14.4.1 unpacking (stage 2)

The Luraph payload has three layers; the two outer (packing) layers are fully cracked
by `GrowAGarden.unpacker.py` (verified to reproduce the VM source byte-for-byte):

1. **Ascii85** — `[=[ ... ]=]` blob, signature `LPH$` skipped (`string.sub(.,5)`), `z`
   shorthand expanded, decoded 5 chars → 4 bytes (`base85 → string.pack(">I4")`).
2. **Custom LZMA** — a hand-rolled range coder (lc=3, lp=0, pb=0; 12-state machine;
   transition table `{0,0,0,0,1,2,3,4,5,6,4,5}`; literal/rep-match/new-match model)
   whose output is `loadstring`-ed. Decompresses to 116 KB of Lua.
3. **The VM itself** (remaining wall) — the decompressed Lua is
   `return({ ...~110 flattened methods... }):R5()(...)`: a register-based VM
   (bootstrap `R5` → setup `s/O/N/b/G/R/U/i7` → executor `E5/W5`), an obfuscated
   constants array `Y` used in opaque arithmetic for every numeric, bit32-based ops,
   and an encrypted constant pool (the original strings are NOT plaintext here; the
   embedded data strings use a keyed encoding, not the outer base85).

Layers 1–2 (the cryptographic/compression part) are done. Layer 3 is full VM
devirtualization, which is a separate, much larger effort.

## Indicators

```
Webhook  : 54fbc67d8a449a6811b1bc076be001b8
Username : I_usebloxflip
Stage 2  : https://raw.githubusercontent.com/reds2/GrowaGarden/refs/heads/main/GrowAGarden   (Luraph v14.4.1)
```

## Stream-cipher constants (recovered)

```
state = (state*133 + 6121588954693) mod 2^45 ; m = (m*83) mod 257 ; carry0 = 23
```
