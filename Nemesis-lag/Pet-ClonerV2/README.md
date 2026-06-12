# Nemesis-lag / Pet-ClonerV2 — `BenGrowHubV2`

`https://raw.githubusercontent.com/Nemesis-lag/Pet-ClonerV2/refs/heads/main/BenGrowHubV2`

A Roblox **Grow a Garden** "Pet Cloner" loader chain. The top loader is obfuscated
with the WeAreDevs VM engine; everything it pulls is plaintext.

| File | Description |
|------|-------------|
| `BenGrowHubV2.obfuscated.lua` | Original obfuscated loader (verbatim). |
| `BenGrowHubV2.deob.lua` | Comment-free reconstruction (single `loadstring`). |
| `bengrowhub.deob.lua` | The next hop (was already plaintext): two `loadstring`s. |
| `BenGrowHub.original.lua` | The final payload (verbatim, already plaintext). |
| `BenGrowHub.petcloner.deob.lua` | Final payload, comments stripped. |

## Chain

```
BenGrowHubV2  (WeAreDevs)
   └─ loadstring HttpGet → https://raw.githubusercontent.com/Ben141-Hub/PetClonerv2/refs/heads/main/bengrowhub  (plaintext)
        ├─ loadstring HttpGet → https://pastefy.app/2u2JHwdB/raw                                  [DEAD: 404 - Paste not found]
        └─ loadstring HttpGet → https://raw.githubusercontent.com/Nemesis-lag/PetClonerV2/refs/heads/main/BenGrowHub  (plaintext)
                = "BenGrow Pet Cloner" GUI
```

## Final payload behaviour

A draggable "🌿 BenGrow Pet Cloner" GUI: pick a pet
(Raccoon / Kitsune / Spinosaurus / Disco Bee / T-Rex / Butterfly / Dragonfly / Fennec Fox),
enter weight + age, hold the matching pet Tool, press "Clone it". It runs a fake 180-second
progress bar, then `Clone()`s the held Tool into the Backpack renamed
`"<Pet> [<weight> KG] [Age <age>]"`. No HttpGet / webhook / clipboard — purely a local
client-side duplication GUI (such client-only clones do not normally replicate to the server).

## Stream-cipher constants (recovered, top loader)

```
state = (state*105 + 26760974823597) mod 2^45 ; m = (m*83) mod 257 ; carry0 = 87
```
