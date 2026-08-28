# Procedural Component Geometry — Slots 48–55

Source authority: `VOIDA/ORIGINAL_JAR/PREPROCESSING_01_06/javap-targeted/wlb.txt`, with generator implementation in `VOIDA/ORIGINAL_JAR/PREPROCESSING_01_06/javap-all.txt` (`jba.a` and `tka.a`).

## Exact native call sites

The procedural component entries are direct calls to the same native generator. The call at bytecode 11480 is **slot 21**, not slot 48; it is already recorded in `COMPONENTS_56.csv`. The remaining seven calls below populate slots 48–50 and 52–55.

| Slot | Native call inputs | Bytecode call |
|---|---|---:|
| 48 | `jba.a(shape, seed=1000L, mode=12, random, variation=mgb.a(iload_0,61), scale=2500L)` | 11972–11988 |
| 49 | `jba.a(shape, seed=500L, mode=12, random, variation=iload_0+45, scale=1250L)` | 12298–12312 |
| 50 | `jba.a(shape, seed=500L, mode=12, random, variation=mgb.a(iload_0,-10), scale=1250L)` | 12622–12638 |
| 51 | direct/object reference (`object`) | source line 307 |
| 52 | `jba.a(shape, seed=1500L, mode=12, random, variation=-127, scale=3000L)` | 13254–13266 |
| 53 | `jba.a(shape, seed=1500L, mode=12, random, variation=123, scale=3000L)` | 13828–13840 |
| 54 | `jba.a(shape, seed=250L, mode=10, random, variation=mgb.a(iload_0,-108), scale=625L)` | 14093–14109 |
| 55 | `jba.a(shape, seed=250L, mode=10, random, variation=122, scale=625L)` | 14377–14389 |

For completeness, the preceding procedural call is slot 21: `jba.a(shape,1000L,12,random,mgb.a(iload_0,47),2500L)` at bytecode 11464–11480.

## Recovered `jba` semantics

Signature:

`static final wfb jba.a(int[][] shape, long seed, int mode, Random random, int variation, long scale)`

The generator implementation is source-verified:

1. If `shape != null`, it takes `shape[0]` as a working polygon row.
2. It reverses each coordinate pair in that first row, then arithmetic-shifts every coordinate right by 4 (`>> 4`).
3. It drops the first row from the supplied `int[][]` and installs the remaining rows as `wfb.w`.
4. If the first row is null, it generates one using `tka.a(seed,55,scale,mode,random)`.
5. It constructs `wfb` from the generated/working polygon and sets `wfb.a(4,102,false)`.
6. It creates three additional polygon rows. For each row `r=0..2`, it calls `tka.a(seed,55,scale*(2/(r+2)),mode,new Random(previousRow[0]))` using the native integer/long arithmetic visible in bytecode 390–410.
7. Each generated row is shifted left by 4 (`<< 4`), then receives deterministic offsets derived from two random/fixed-point values. The exact operations are bytecode 470–603.
8. The resulting `wfb` is marked `m=true`, `k=false`, receives `a(121,8)`, `B=16`, and `r=true`.

So `jba` is no longer an unresolved black box. Its control flow, parameter boundary, fixed-point transforms, row-generation count, and output flags are recovered directly from the original bytecode.

## Recovered `tka` semantics

Signature:

`tka.a(long seed, byte mode, long scale, int variation, Random random)`

For mode `55`, the native implementation:

- allocates a coordinate array from `scale / variation` using native fixed-point arithmetic;
- walks coordinate pairs;
- derives a per-pair seed from `scale` and `random`;
- evaluates the native lookup/math functions `fc.a(angle,-124)` and `eu.a(angle,67)`;
- multiplies those results by the derived seed and shifts using the native fixed-point constants;
- returns the coordinate array.

The implementation is `tka.a` bytecode 0–139 in `javap-all.txt`. The helper functions are also present in the original-JAR decompilation and should be treated as implementation dependencies, not replaced with guessed gameplay values.

## Shape-array authority

Each `jba` call receives a literal `int[][]` constructed immediately before the invocation. Those arrays are part of the native input and must not be replaced by a generic procedural seed alone. The complete literals remain available in the immutable `wlb.txt` bytecode ranges surrounding the call sites above.

## Port consequence

The replacement implementation must preserve, at minimum:

- exact seed;
- exact mode;
- exact scale;
- exact variation expression/value;
- exact supplied shape-array contents and row ordering;
- native `>>4` / `<<4` fixed-point transforms;
- three generated rows;
- deterministic row seeding from the previous row;
- native output flags/fields.

No static polygon approximation is authorized for these entries.
