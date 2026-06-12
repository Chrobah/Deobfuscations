# reds2 / femboy1 — `GardenSpawner`

`https://raw.githubusercontent.com/reds2/femboy1/refs/heads/main/GardenSpawner`

A Roblox **Grow a Garden** loader obfuscated with the WeAreDevs (`wearedevs.net/obfuscator`)
VM engine. It is a **webhook stealer**: after an anti-tamper check it sets global
`Username` / `Webhook` and downloads + runs a second stage that exfiltrates with them.

| File | Description |
|------|-------------|
| `GardenSpawner.obfuscated.lua` | Original obfuscated loader (verbatim). |
| `GardenSpawner.deob.lua` | Comment-free reconstruction. |
| `GrowAGarden.luraph-payload.lua` | The stage-2 payload (verbatim). **Protected with Luraph Obfuscator v14.4.1** — a commercial bytecode-VM obfuscator that is not statically devirtualizable here; archived as-is. |

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
