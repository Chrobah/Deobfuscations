# riley — a virtualizing Luau (Roblox) obfuscator

riley is a **VM-based** obfuscator: it doesn't transform your source, it **replaces it**.
Your code is parsed, compiled to bytecode for a custom virtual machine, and shipped as
opaque data plus a generic interpreter. A decompiler that dumps the Roblox bytecode now
sees the *interpreter* and a blob of numbers — not your control flow, not your logic.

This is the real-virtualization tier (the same *category* as Luraph/MoonSec), a big step
above source-level string obfuscation. Read the "Honesty" section for where it sits
relative to Luraph and what it costs.

```
python3 riley.py MyScript.luau -o Protected.luau [--seed N] [--place-lock ID] [--anti-tamper] [--verify]
```

## Pipeline

```
your .luau
  └─[rlex/rparse]→ AST
      └─[rcompile]→ VM program:  per-function bytecode (opcode tables) + constant pool + captured globals
          └─[rserialize + rvm]→ a generic interpreter (scopes, closures, metatables, multi-returns, varargs)
                                 walking that program;  opcode numbers randomized per build
              └─[luaobf]→ encrypt the constant pool, obfuscate the interpreter's own
                          identifiers/fields, minify, wrap in a closure
```

Net effect on the shipped bytecode:
- **Your strings** (service/remote names, messages, asset ids) → encrypted constant pool.
- **Your logic / control flow** → opcode data interpreted by the VM (gone from the bytecode as recognizable code).
- **The interpreter itself** → obfuscated + minified, with **per-build-randomized opcodes** (no two builds share an opcode map, so a devirtualizer can't be reused).

## Verified coverage (behaviour-identical to native, tested on the real Luau runtime)

locals & block scoping & shadowing · globals · all operators (`+ - * / // % ^ ..`, comparisons,
`and/or` short-circuit, `not # -`, bit32) · `if/elseif/else` · `while` · `repeat/until` ·
numeric `for` (incl. negative/float step) · generic `for ... in` · `break` / `continue` ·
multiple assignment · compound assignment (`+=` … evaluates the target once) · function decls,
**closures with shared upvalues**, **upvalue writes**, **per-iteration loop capture** ·
method calls & `self` · **multiple return values** & truncation via `()` · **varargs** (`...`,
`select`) · recursion · **table constructors** (array/record/mixed/trailing-multi) ·
**metatables/metamethods** (`__index`, `__add`, `__eq`, `__lt`, `__call`, `__tostring`, …) ·
`pcall`/`error` · string interpolation · type annotations (parsed & erased).

`riley.py … --verify` re-checks every build with `luau-compile`.

## Options

```
--seed N         deterministic, reproducible build (also fixes the random opcode map). Omit = random.
--place-lock ID  bind the encrypted constants to a Roblox PlaceId (stolen copy decrypts to garbage elsewhere).
--anti-tamper    load-time integrity check.
--no-harden      emit the raw VM without the luaobf encryption layer (for debugging).
--verify         compile-check the output with luau-compile.
```

## Not supported / caveats (read before shipping)

- **`goto` / labels** → riley errors out (won't silently miscompile). Rewrite with `if`/`while`/`continue`.
- **Performance**: it's a tree-walking VM, so compute-heavy code runs *tens of times* slower
  (≈70× on a tight `fib`+loop benchmark). For event-driven game logic (UI, remotes, input)
  this is unnoticeable; **do not virtualize per-frame hot math loops** — leave those as plain
  `LocalScript`s and only run riley on the logic you care about hiding.
- **Globals are snapshotted** at start into a captured table (reads see the startup value; writes
  stay internal to the script). Fine for normal client code; don't use riley on a script whose
  job is to mutate a shared global that *other* scripts read.
- **String interpolation** is desugared to `..tostring(...)` (equivalent for normal use).
- Always test the protected `LocalScript`/`ModuleScript` in Studio + a live session before shipping.

## Honesty: how strong is this, really?

- It is a **genuine VM** — your logic becomes data, which is the thing source-level obfuscation
  can't do and the thing that makes Luraph hard. That's a real, large step up.
- It is **not** as strong as a mature Luraph build. Gaps: Luraph uses a **register VM** (faster,
  harder to devirtualize than a tree-walker), adds **packing** (Ascii85+LZMA) and **runtime
  anti-analysis**, and has years of per-build mutation/hardening. riley has opcode-randomization +
  encrypted constants + an obfuscated interpreter, but a single VM design and no packing/anti-analysis.
- **No client-side scheme is unbreakable.** The VM and the constant key ship on the client, so a
  determined analyst can run the interpreter and recover constants, then devirtualize the opcode
  data. riley raises that cost from "one-click decompile" to "write a custom devirtualizer for a
  polymorphic VM" — which stops essentially everyone except a dedicated reverser. For truly
  sensitive logic, keep it on the **server**.

Natural next upgrades (in rough order of strength-per-effort): a **register VM** (speed +
devirt resistance), **proto/bytecode packing**, **handler mutation/duplication**, and
**environment-derived keys / anti-instrumentation**.

## Requirements

Python 3 only (bundled `luaobf.py` is the hardening layer). `--verify` uses `luau-compile` if on PATH.
