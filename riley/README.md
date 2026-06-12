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

## Honesty: how strong is this, really? (read this)

Measured against Luraph's public changelog (v8 → v14.7 — i.e. ~6 years of a full-time
arms race), here is the real picture. Do not treat riley as Luraph-equivalent.

**What riley does (verified):**
- Real virtualization: your logic becomes bytecode interpreted by a generic VM.
- Per-build randomized opcodes (breaks cross-build signatures — Luraph does this too).
- **Serialized + encrypted bytecode**: the program (control flow + constant pool) is a flat
  byte blob, encrypted by the hardening layer and rebuilt at runtime by a deserializer.
  Static dumping of constants/structure is defeated (cf. Luraph's "deserialize a raw blob",
  `dumpmeme`, "constant dumping difficult without running the whole script").
- Encrypted strings + obfuscated interpreter + minify + wrap.

**What Luraph has that riley does NOT (the honest gap):**
- A **register VM** with years of perf work (riley is a tree-walking VM → tens-of-× slower).
- **Anti-dump / anti-tamper / anti-debug** woven into control flow (TrollVM™, integrity checks,
  control-flow "trap" redirection, debug-library tamper detection, disassembler/decompiler crashers).
  riley has only a trivial load-time sanity check.
- **Metamorphic VM** (the interpreter itself mutates per build) + **control-flow scrambling**
  ("scrambledeggs"), opaque predicates, junk instructions. riley randomizes opcodes but does not
  mutate the VM body or scramble control flow yet.
- **Environment / platform locking**, per-function macros (`LPH_NO_VIRTUALIZE`, `LPH_ENCFUNC`), and —
  most importantly — a team shipping **weekly updates specifically to defeat new deobfuscators**.

**Bottom line:** riley is a *correct* VM obfuscator with one serious security layer (encrypted
bytecode / anti-dump). On Luraph's timeline it is early-era. **No one-session tool reaches parity
with a mature, actively-maintained commercial obfuscator** — claiming otherwise would be dishonest.
And it is still client-side: the VM + keys ship to the player, so a determined reverser who *runs*
it can recover everything. riley raises the bar from "one-click decompile" to "write a custom
devirtualizer for a polymorphic, encrypted-bytecode VM" — which stops nearly everyone, but not a
dedicated expert. For truly sensitive logic, keep it on the **server**.

## Roadmap (in honest strength-per-effort order)

1. ✅ Serialized + encrypted bytecode (anti-static-dump) — **done**.
2. **Control-flow scrambling + opaque predicates + junk** in the bytecode — makes devirtualization
   hard *after* a dump; completable + verifiable.
3. **Register VM** — fixes the perf gap and is harder to devirtualize than a tree-walker.
4. **Anti-tamper feeding the key** (integrity → decryption) + **environment-derived keys** —
   needs real Studio testing; can break things if rushed.
5. **VM metamorphism** (mutate the interpreter per build) — the deepest signature defense.
6. Per-function controls (exclude hot paths from virtualization), packing.

Items 4–6 trend toward "team running an arms race" and are where parity actually lives.

## Requirements

Python 3 only (bundled `luaobf.py` is the hardening layer). `--verify` uses `luau-compile` if on PATH.
