# luaobf — Luau (Roblox) anti-decompilation obfuscator

A single-file, dependency-free Python CLI that obfuscates **your own** Luau source
(`LocalScript` / `ModuleScript`) to make exploiter decompilation far less useful.
Built from hands-on analysis of how Roblox decompilers actually recover readable code.

```
python3 luaobf.py input.luau -o output.luau [options]
```

## Why this works (and what it targets)

Roblox ships your script to the client as **Luau bytecode**; exploiters dump and
decompile it. The single biggest thing that makes decompiled output *readable* is the
**constant table** — and on Roblox that table contains:

- every **string literal** (service names, remote names, messages, asset ids), AND
- every **field / method name** you access with `.` or `:` (`game.Players`,
  `obj:FireServer`) — these are compiled to string constants for the index opcodes, AND
- table-constructor keys and global names.

luaobf removes the first two from the program: literals and `.field`/`:method` names are
moved into an encrypted pool and resolved at runtime, so a decompile shows
`R(14)[(R(9))](...)` instead of `ReplicatedStorage:FireServer(...)`.

## What it does

| Pass | Effect |
|------|--------|
| **String encryption** | every string literal → encrypted pool + runtime `R(n)` lookup (cached) |
| **Field indexing** | `a.b` → `a[(R(n))]` (skips `function a.b()` declaration headers) |
| **Method calls** | `obj:m(args)` → `obj[(R(n))](obj, args)` for lone-name receivers (safe; no double-eval) |
| **Per-build cipher** | the keystream (256-byte key + 3 params) is randomized per `--seed`; two builds share no structure |
| **Minify + wrap** | comments/whitespace stripped; whole script wrapped in one closure |
| **Type-aware** | string singleton types (`type X = "a"|"b"`, `x: "a"`) are left intact so it never breaks typed code |

Every output is verified to **compile and behave identically** (tested across many
scripts × seeds; `--verify` re-checks each build with `luau-compile`).

## Options

```
--seed N          deterministic build (reproducible). Omit for random each run.
--place-lock ID   mix game.PlaceId into the key — the script only decrypts in PlaceId ID
                  (a stolen copy run in another game gets garbage). Get ID from the place URL.
--anti-tamper     add a load-time integrity check (derails if bit32/string are replaced)
--no-index        string-only mode (don't touch .field/:method) — maximal safety fallback
--no-minify       keep readable formatting (for debugging the output)
--verify          compile-check the output with luau-compile (recommended)
```

## Example

```
python3 luaobf.py example.luau --place-lock 1234567890 --anti-tamper --verify -o protected.luau
```

After this, `GetService`, `WaitForChild`, `FireServer`, remote names, GUI names and all
messages are gone from the constant table; a decompiler yields opaque `R(n)` calls.

## Honest limitations (read these)

- **No client-side obfuscation is unbreakable.** Anything that runs on the user's machine
  can be made to reveal itself by a determined analyst (I demonstrated this by cracking
  three commercial obfuscators to build this). This raises the *cost* and stops the
  one-click-decompiler crowd; it is not DRM.
- **Recover the key by running it.** The keystream lives in the output (it has to — it runs
  on the client). A skilled attacker can dump the pool by executing the decryptor. The win
  is that casual decompilation no longer yields readable strings/calls.
- **Still leaks** (would need a full Luau parser / scope analysis to close): **global names**
  (`game`, `print`) via GETGLOBAL, **table-constructor keys** (`{Title=...}`),
  **chained-/complex-receiver method names** (`a:b():c()` — the `c`), and the contents of
  **backtick interpolation strings** (passed through untouched). None of these are the
  high-value secrets, but be aware.
- **Test in Studio.** Behavior is verified here on the open-source Luau runtime; always run
  the obfuscated `LocalScript`/`ModuleScript` in Studio + a live test before shipping,
  especially with `--place-lock`/`--anti-tamper`.
- The strongest protection for truly sensitive logic is **not shipping it to the client at
  all** (run it on the server / a backend you control). Obfuscation protects what *must*
  live client-side.

## Requirements

Python 3 only (no packages). `--verify` additionally uses `luau-compile` if it's on PATH.
