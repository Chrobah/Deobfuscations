#!/usr/bin/env python3
"""riley - a virtualizing Luau (Roblox) obfuscator.
Pipeline:  your code --[parse]--> AST --[compile]--> bytecode + constant pool
           --[serialize]--> generic VM interpreter over that data
           --[luaobf]--> encrypt constants + obfuscate the interpreter + minify + wrap
A decompiler now sees the interpreter and an opaque data blob, not your logic.
"""
import argparse, sys, random
import rcompile, rserialize, luaobf, scramble as scrambler, rvmreg_gen

def build(src, seed=None, place_lock=0, anti_tamper=False, harden=True, scramble_level=1.0, register=False):
    rng = random.Random(seed if seed is not None else random.randrange(1<<31))
    import os
    if register:
        # register-machine VM: flat per-proto bytecode, per-build randomized opcodes
        virt = rvmreg_gen.generate(src, rng, anti_tamper=anti_tamper, scramble=scramble_level)
        if not harden:
            return virt
        return luaobf.obfuscate(virt, seed=rng.randrange(1<<31), place_lock=place_lock,
                                minify=True, anti_tamper=anti_tamper, do_index=True)
    vm = open(os.path.join(os.path.dirname(os.path.abspath(__file__)),'rvm.luau')).read()
    # per-build opcode randomization (polymorphism)
    vals = rng.sample(range(3, 240), len(rserialize.OPNAMES))
    opmap = dict(zip(rserialize.OPNAMES, vals))
    for n,v in opmap.items(): setattr(rcompile, n, v)
    prog = rcompile.compile_src(src)
    if scramble_level>0:
        scrambler.scramble(prog, rng, intensity=scramble_level)
    virt = rserialize.emit_program(prog, vm, opmap, anti_tamper=anti_tamper)   # virtualized + scrambled + (opt) anti-tamper
    if not harden:
        return virt
    # final hardening layer: encrypt the constant pool strings, obfuscate the
    # interpreter's identifiers/fields, minify, wrap.
    return luaobf.obfuscate(virt, seed=rng.randrange(1<<31),
                            place_lock=place_lock, minify=True,
                            anti_tamper=anti_tamper, do_index=True)

def main():
    ap=argparse.ArgumentParser(description='riley - virtualizing Luau obfuscator')
    ap.add_argument('input'); ap.add_argument('-o','--output')
    ap.add_argument('--seed', type=int, default=None)
    ap.add_argument('--place-lock', type=int, default=0)
    ap.add_argument('--anti-tamper', action='store_true')
    ap.add_argument('--scramble', type=float, default=1.0, help='control-flow scramble intensity 0..2 (default 1)')
    ap.add_argument('--register', action='store_true', help='use the register-machine VM (faster, flatter bytecode)')
    ap.add_argument('--no-harden', action='store_true', help='emit the raw VM (debug)')
    ap.add_argument('--verify', action='store_true')
    a=ap.parse_args()
    out=build(open(a.input,encoding='utf-8').read(), seed=a.seed,
              place_lock=a.place_lock, anti_tamper=a.anti_tamper, harden=not a.no_harden, scramble_level=a.scramble, register=a.register)
    if a.output: open(a.output,'w',encoding='utf-8').write(out)
    else: sys.stdout.write(out)
    if a.verify:
        import shutil, subprocess, tempfile
        luc=shutil.which('luau-compile')
        if luc:
            tf=tempfile.NamedTemporaryFile('w',suffix='.luau',delete=False); tf.write(out); tf.close()
            r=subprocess.run([luc,'--binary',tf.name], stdout=subprocess.DEVNULL, stderr=subprocess.PIPE)
            sys.stderr.write('[verify] compiles OK\n' if r.returncode==0 else '[verify] FAILED\n'+r.stderr.decode('utf-8','replace'))
            if r.returncode!=0: sys.exit(2)
        else: sys.stderr.write('[verify] luau-compile not on PATH\n')

if __name__=='__main__': main()
