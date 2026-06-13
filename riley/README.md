# riley — a virtualizing Luau (Roblox) obfuscator

riley is a **VM-based** obfuscator: it doesn't transform your source, it **replaces it**.
Your code is parsed, compiled to bytecode for a custom virtual machine, and shipped as
opaque data plus a generic interpreter. A decompiler that dumps the Roblox bytecode now
sees the *interpreter* and a blob of numbers — not your control flow, not your logic.

This is the real-virtualization tier (the same *category* as Luraph/MoonSec), a big step
above source-level string obfuscation. Read the "Honesty" section for where it sits
relative to Luraph and what it costs.

```
python3 riley.py MyScript.luau -o Protected.luau [--seed N] [--place-lock ID] [--anti-tamper] [--scramble F] [--verify]
```

Worked examples (input + protected output, each verified identical to native) live in [`samples/`](samples/).

## Pipeline

```
your .luau
  └─[rlex/rparse]→ AST
      └─[rasm]→ register bytecode: flat per-function instruction stream (jumps) + constant pool
          └─[rvmreg_gen]→ a generic register interpreter (scopes, closures, metatables, multi-returns,
                          varargs, generalized iteration); bytecode serialized to an encrypted blob &
                          rebuilt by a deserializer at runtime; opcodes randomized per build; the
                          constant pool is XOR-encoded INSIDE the blob and decoded only at runtime
              └─[luaobf]→ encrypt the constant pool, obfuscate the interpreter's own
                          identifiers/fields, minify, wrap in a closure
```

(`--tree` swaps the first two stages for the `rcompile` + `rserialize`/`rvm` tree-walker; everything
downstream is identical.)

Net effect on the shipped bytecode:
- **Your strings** (service/remote names, messages, asset ids) → encrypted constant pool.
- **Your logic / control flow** → opcode data interpreted by the VM (gone from the bytecode as recognizable code).
- **The interpreter itself** → obfuscated + minified, with **per-build-randomized opcodes** (no two builds share an opcode map, so a devirtualizer can't be reused).

## Verified coverage (behaviour-identical to native, tested on the real Luau runtime)

locals & block scoping & shadowing · globals · all operators (`+ - * / // % ^ ..`, comparisons,
`and/or` short-circuit, `not # -`, bit32) · `if/elseif/else` · `while` · `repeat/until` ·
numeric `for` (incl. negative/float step) · generic `for ... in` · **Luau generalized iteration**
(`for k,v in t do` over tables / `__iter`) · `break` / `continue` ·
multiple assignment · compound assignment (`+=` … evaluates the target once) · function decls,
**closures with shared upvalues**, **upvalue writes**, **per-iteration loop capture** ·
method calls & `self` · **multiple return values** & truncation via `()` · **varargs** (`...`,
`select`) · recursion · **table constructors** (array/record/mixed/trailing-multi) ·
**metatables/metamethods** (`__index`, `__add`, `__eq`, `__lt`, `__call`, `__tostring`, `__iter`, …) ·
**live globals** (reads/writes hit the real environment, visible across scripts) · `pcall`/`error` ·
string interpolation · number literals (hex/binary/underscores) · type annotations **and `type` / `export type` aliases** (parsed & erased, incl. string-literal unions / function / table types).

`riley.py … --verify` re-checks every build with `luau-compile`.

## Against decompilers / leaks (measured, not claimed)

The real Roblox dev threat is: someone dumps your `LocalScript`/`ModuleScript` with a decompiler or
`saveinstance`, reads it, and reuses your logic. The test that matters is what survives in the
**compiled bytecode** a decompiler works from. Measured with `luau-compile --dump-constants`:

| script | native bytecode | riley-protected bytecode |
|--------|-----------------|--------------------------|
| score-signer (has a secret salt) | secret salt + opcodes in plaintext `K`s | **0 string constants** |
| Signatures (executor/brand name list) | **229** plaintext strings (`getgenv`, `msdoors`, `rbxassetid://…`, …) | **0** — none recoverable |

A decompiler run on a riley output reconstructs the *interpreter* (a flat dispatch over numeric
opcodes) plus an encrypted blob — **not your code, not your strings**. Strings are protected by two
independent layers (XOR-encoded inside the bytecode blob, then the whole blob encrypted by the
hardening layer), so even peeling the outer layer and deserializing does not surface plaintext.

## Options

```
--seed N         deterministic, reproducible build (also fixes the random opcode map). Omit = random.
--place-lock ID  bind the encrypted constants to a Roblox PlaceId (stolen copy decrypts to garbage elsewhere).
--anti-tamper    weave a bytecode-blob integrity check into execution (tamper -> derail).
--scramble F     control-flow scramble intensity (0=off, 1=default, 2=heavy).
--tree           use the tree-walker VM instead of the default register VM.
--no-harden      emit the raw VM without the luaobf encryption layer (for debugging).
--verify         compile-check the output with luau-compile.
```

## Two VMs

riley ships two virtual machines — **both** blob-serialized + encrypted, with `--scramble`,
`--anti-tamper`, `--place-lock`, per-build randomized opcodes, live globals, and full Luau coverage:

- **Register machine (default)** — your code is compiled to a flat, register-based instruction
  stream (a real bytecode with jumps, like Lua's own VM) with **capture-analysed local boxing** (only
  locals captured by a closure are heap-boxed). Harder to devirtualize than a tree, and faster.
  Scrambling here inserts dead instruction blocks (a jump over junk that never executes).
- **Tree-walker (`--tree`)** — the program is a serialized encrypted byte blob walked recursively.
  The original VM; kept for VM diversity (two different interpreters = no single reusable devirtualizer).

Both are verified behaviour-identical to native on the same suite (locals/closures/upvalues,
per-iteration capture, generalized iteration, multi-return, varargs, metatables, all control flow),
plus a **700-program differential fuzzer** for the register VM (clean and scrambled). The register VM
runs **~1.3–1.7× faster** than the tree-walker.

## Behaviour & coverage

riley accepts **all of Luau** and preserves behaviour. There are no language features it silently
mishandles; specifically, the things that *used* to be caveats are resolved:

- **Full Luau syntax** including generalized iteration (`for k,v in t do`), `__iter`, compound ops,
  string interpolation (faithfully — Luau itself `tostring`s each piece), hex/binary/`_` number
  literals, and type annotations. (`goto`/labels are **not part of Luau** at all — Roblox never
  adopted them — so riley rejects them exactly like the Luau compiler does.)
- **Live globals** — global reads and writes go to the real environment (`getfenv`), so a value
  written in a virtualized script is visible to other scripts, and reads see live values. No snapshot.
- **String interpolation** is faithful to Luau semantics.

The only two costs are **inherent to virtualizing client code** — they are properties of the whole
category (Luraph included), not riley bugs, and cannot be engineered away:

1. **It's an interpreter, so it's slower than native.** Measured slowdown: **~20× on typical
   table/string/event game code, up to ~70× on tight recursion/arithmetic** (worst case). This is
   unnoticeable for event-driven logic (UI, remotes, input, gameplay rules); the one rule is **don't
   virtualize a per-frame hot math loop** — leave that as a plain `LocalScript` and virtualize the
   logic you actually want hidden. No Lua-in-Lua VM reaches native speed.
2. **It's client-side, so a determined reverser who *runs* it can recover logic.** The VM + keys ship
   to the player. riley raises the bar from "one-click decompile" to "write a custom devirtualizer for
   a polymorphic, encrypted-bytecode VM," which stops nearly everyone — but for logic that must stay
   secret from *everyone* (anti-cheat verdicts, economy authority), keep it on the **server**. This is
   true of every client obfuscator that exists.

As always, test the protected `LocalScript`/`ModuleScript` in Studio + a live session before shipping.

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

**What riley now also has (since the first cut):**
- A **register VM** (now the default): flat register bytecode, capture-analysed local boxing,
  blob-serialized + encrypted, full Luau coverage, ~1.3–1.7× faster than the tree-walker.
- A **metamorphic register VM** — every build differs *structurally*, not just in opcode numbers:
  per-build **operand-slot permutation** (the bytecode encoding contract changes), **dispatch
  reordering**, and **dead-opcode branches + junk** in the interpreter. No two builds share a VM,
  so signatures and a recorded opcode/operand map don't transfer between builds.
- **Control-flow scrambling** (`--scramble`, both VMs): opaque-predicate-guarded dead branches and
  junk in the tree-walker; dead instruction blocks (jump-over-junk) in the register VM.
- **Anti-tamper** (`--anti-tamper`, both VMs): a blob checksum woven into entry selection (tamper → derail).
- **Full Luau coverage + live globals** — generalized iteration, `__iter`, and real-environment
  globals; no language caveats remain.

**What Luraph has that riley still does NOT (the honest gap):**
- A register VM with **years of perf work**. riley's exists and is blob-serialized, but it's still a
  hosted interpreter (~20–70× slower than native, workload-dependent).
- **Anti-debug / decompiler-crashers** and trap-redirected control flow (TrollVM™, debug-library
  tamper detection). riley's anti-tamper is a single woven integrity check, and client-side.
- **Deeper metamorphism.** riley mutates the VM's *structure* (operand layout, dispatch order, junk,
  opcodes) per build, which defeats signatures and map-replay — but it does not yet rewrite the VM's
  *logic* per build, so a skilled human writing an adaptive lifter can still re-derive each build.
- **Environment / platform locking**, per-function macros (`LPH_NO_VIRTUALIZE`, `LPH_ENCFUNC`), and —
  most importantly — a team shipping **weekly updates specifically to defeat new deobfuscators**.

**Bottom line:** riley is a *correct* two-VM obfuscator with real security layers (encrypted
bytecode / anti-dump, control-flow scrambling, woven anti-tamper). On Luraph's timeline it is
early-era. **No one-session tool reaches parity
with a mature, actively-maintained commercial obfuscator** — claiming otherwise would be dishonest.
And it is still client-side: the VM + keys ship to the player, so a determined reverser who *runs*
it can recover everything. riley raises the bar from "one-click decompile" to "write a custom
devirtualizer for a polymorphic, encrypted-bytecode VM" — which stops nearly everyone, but not a
dedicated expert. For truly sensitive logic, keep it on the **server**.

## Roadmap (in honest strength-per-effort order)

1. ✅ Serialized + encrypted bytecode (anti-static-dump) — **done**.
2. ✅ **Control-flow scrambling** — opaque-predicate-guarded dead branches + side-effect-free junk
   injected throughout the bytecode (`--scramble`, default on). Verified behaviour-safe.
3. ✅ **Anti-tamper** — a checksum of the bytecode blob woven into entry-proto selection
   (`--anti-tamper`): tamper the blob and it derails instead of running modified. (Client-side, so
   inherently limited — an attacker who controls the runtime can still hook around it.)
4. ✅ **Register VM (now the default)** — flat register bytecode (a real instruction stream with jumps),
   capture-analysed local boxing, blob-serialized + encrypted, `--scramble`/`--anti-tamper`/`--place-lock`,
   ~1.3–1.7× faster than the tree-walker. Verified behaviour-identical (suite + 700-program fuzzer).
5. ✅ **Full Luau coverage + live globals** — generalized iteration / `__iter`, real-environment globals;
   no language caveats remain on either VM.
6. ✅ **Metamorphic register VM** — per-build operand-slot permutation, dispatch reordering, and
   dead-opcode branches/junk, on top of randomized opcodes. No two builds share a VM structure.
   Verified behaviour-identical (suite × 12 seeds + 500-program fuzzer incl. `__add` metamethods).
7. **Deeper metamorphism** (rewrite the VM's *logic* per build, not just its layout) — the endgame
   signature defense, and where a team running an arms race actually lives.
8. **Environment-derived keys**, per-function controls (exclude hot paths), packing.

## Requirements

Python 3 only (bundled `luaobf.py` is the hardening layer). `--verify` uses `luau-compile` if on PATH.
