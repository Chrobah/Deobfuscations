# riley samples

Each `NN_name.luau` is a plain input; `NN_name.protected.luau` is the riley output, built with:

```
python3 ../riley.py NN_name.luau --anti-tamper --scramble 2 --seed 100 -o NN_name.protected.luau
```

(the default register VM, integrity check woven in, control flow scrambled). Every protected
file is **verified to produce byte-identical output to its source** on the real Luau runtime,
and to compile cleanly under `luau-compile`.

| sample | what it shows |
|--------|---------------|
| `01_score_signer`     | a secret salt + a hashing routine you don't want read or tampered with — strings encrypted, logic gone from the bytecode |
| `02_cooldown_module`  | typical game logic: OOP/metatables, method chaining, **generalized iteration** (`for k,v in t do`), closures |
| `03_feature_showcase` | breadth: higher-order functions, shared upvalues, operator metamethods, varargs, multiple returns, string interpolation |

Run any of them:

```
luau 02_cooldown_module.luau              # original
luau 02_cooldown_module.protected.luau    # protected — identical output
```

To confirm a protected file has none of your source left in it:

```
grep -c "SECRET_SALT\|16777619\|makePayload" 01_score_signer.protected.luau   # -> 0
```
