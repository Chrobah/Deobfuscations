# Brunfua / sickheads — `loadergag.txt`  (+ what it loads)

Deobfuscation of the full 2-stage chain starting at
`https://raw.githubusercontent.com/Brunfua/sickheads/refs/heads/main/loadergag.txt`
(a Roblox **Grow a Garden** "anticheat bypasser", by **Nozrakk**).

Both stages use the same `wearedevs.net/obfuscator` v1.0.0 VM engine as the
`ezvbs/gag-scripts` sample (custom-base64 string table + array-reversal shuffle +
a per-string LCG stream cipher + control-flow-flattened state-machine VM).

| File | Description |
|------|-------------|
| `loadergag.txt` | Stage 1, original obfuscated loader (verbatim). |
| `loadergag.reconstructed.lua` | Stage 1 reconstruction (Rayfield key-system loader). |
| `Nozrakk-sszz-zz.obfuscated.lua` | Stage 2, original obfuscated payload, fetched from the URL below (verbatim). |
| `Nozrakk-sszz-zz.reconstructed.lua` | Stage 2 reconstruction (Seed/Pet spawner GUI). |

## The chain

```
loadergag.txt  (stage 1, Brunfua/sickheads)
   │  Rayfield key-system GUI: "Grow A Garden anticheat bypasser — by Nozrakk"
   │  • directs the user to a paid link-shortener for the key:
   │        https://bstshrt.com/nozrakk/ck1        (also copied to clipboard)
   │  • accepts a key, validated against:
   │        https://pastebin.com/raw/tnBqbcZM
   │        -> current valid key:  ssasdnsjdnsajnsadjndsajndjndsajnajsndnjsdajnas
   │  • "Load script" button →
   ▼
game:HttpGetAsync("https://raw.githubusercontent.com/Nozrakk/sszz/refs/heads/main/zz")
   │  → loadstring(...)()
   ▼
zz  (stage 2, Nozrakk/sszz)
      a draggable "Seed Spawner" / PetSpawnerGUI: clones models from
      ReplicatedStorage.Seed_Models and places them at the mouse-aimed world
      point (camera ray → workspace:Raycast); also creates/updates Backpack Tools.
      No HttpGet / loadstring / clipboard / webhook — a game cheat, not a stealer.
```

## Indicators

```
Author          : Nozrakk
Link-shortener  : https://bstshrt.com/nozrakk/ck1      (monetisation gate)
Valid-key paste : https://pastebin.com/raw/tnBqbcZM   -> ssasdnsjdnsajnsadjndsajndjndsajnajsndnjsdajnas
Stage-2 payload : https://raw.githubusercontent.com/Nozrakk/sszz/refs/heads/main/zz
Clipboard text  : "Key copied to clipboard!"
Config folder   : PeterHack  (Rayfield ConfigurationSaving)
```

## Stream-cipher constants (recovered, per stage)

Same algorithm both stages — only the constants are randomised by the obfuscator:

```
keystream:  state = (state*MULT + ADD) mod 2^45          (seed = key mod 2^45)
            m     = (m*MM) mod 257                        (seed = (key mod 255)+2)
            v     = ror32( floor(state / 2^(13-floor(m/32))) mod 2^32 , m mod 32 )
            bytes emitted big-endian, 4 at a time
plaintext[i] = (cipher[i] + keystream[i] + carry) mod 256 ; carry chains from output

            MULT   ADD               MM    carry0
  stage 1   17     33994022075859    245   131
  stage 2   125    8034868842141     27    18
```

## Method (fully static — neither stage was executed)

1. Re-implemented the base64 decoder + reversal shuffle → all constants
   (stage 1: 101 entries, stage 2: 246).
2. Constant-folded the arithmetic, inlined the `J(n)` / `C(n)` constant lookups,
   fixed unary-minus gluing, isolated the `function(U,…)` / `function(p,…)`
   dispatch and parsed its binary-search tree into leaf handlers.
3. Symbolically resolved each handler's terminal jump → rebuilt the CFG, which
   exposed the LCG stream cipher; re-implemented it in Python and brute-forced
   the per-string key to decrypt every blob.
4. `zz` was fetched once over HTTP for analysis only and never run.
