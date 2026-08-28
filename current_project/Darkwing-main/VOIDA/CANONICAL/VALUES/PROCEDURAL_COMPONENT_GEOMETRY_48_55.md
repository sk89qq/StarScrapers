# Procedural Component Geometry — Slots 48–55

Source authority: `VOIDA/ORIGINAL_JAR/PREPROCESSING_01_06/javap-targeted/wlb.txt`, with generator implementation in `VOIDA/ORIGINAL_JAR/PREPROCESSING_01_06/javap-all.txt` (`jba.a` and `tka.a`).

## Exact native call sites

The eight slots are not arbitrary procedural placeholders. Each is a direct call to the same native generator:

| Slot | Native call inputs | Bytecode call |
|---|---|---:|
| 48 | `jba.a(shape, seed=1000L, mode=12, random, variation=mgb.a(iload_0,47), scale=2500L)` | 11464–11480 |
| 49 | `jba.a(shape, seed=1000L, mode=12, random, variation=mgb.a(iload_0,61), scale=2500L)` | 11972–11988 |
| 50 | `jba.a(shape, seed=500L, mode=12, random, variation=iload_0+45, scale=1250L)` | 12298–12312 |
| 51 | direct object/reference; not one of the eight `jba` calls | 12638 call follows slot 52 construction |
| 52 | `jba.a(shape, seed=500L, mode=12, random, variation=mgb.a(iload_0,-10), scale=1250L)` | 12622–12638 |
| 53 | `jba.a(shape, seed=1500L, mode=12, random, variation=-127, scale=3000L)` | 13254–13266 |
| 54 | `jba.a(shape, seed=1500L, mode=12, random, variation=123, scale=3000L)` | 13828–13840 |
| 55 | `jba.a(shape, seed=250L, mode=10, random, variation=mgb.a(iload_0,-108), scale=625L)` | 14093–14109 |

**Important correction:** the eight `jba` invocations in this construction chain populate native slots 47–50 and 52–55 according to the surrounding `hab.g` stores. The canonical `COMPONENTS_56.csv` labels the procedural definitions as slots 48–55; slot 51 is a direct/object reference at source line 307. Do not silently renumber the native table without reconciling the complete initializer chain.

## Recovered `jba` semantics

Signature:

`static final wfb jba.a(int[][] shape, long seed, int mode, Random random, int variation, long scale)`

The generator implementation is source-verified:

1. If `shape != null`, it takes `shape[0]` as a working polygon row.
2. It reverses each coordinate pair in that first row, then arithmetic-shifts every coordinate right by 4 (`>> 4`).
3. It drops the first row from the supplied `int[][]` and installs the remaining rows as `wfb.w`.
4. If the first row is null, it generates one using `tka.a(seed, 55, scale, mode, random)`.
5. It constructs `wfb` from the generated/working polygon and sets `wfb.a(4,102,false)`.
6. It creates three additional polygon rows. For each row `r=0..2`, it calls:
   `tka.a(seed, 55, scale * (2/(r+2)), mode, new Random(previousRow[0]))`.
7. Every coordinate in those generated rows is shifted left by 4 (`<< 4`), then receives deterministic offsets derived from two random/fixed-point values. The exact native operations are in `jba.a` bytecode 322–603.
8. The resulting `wfb` is marked `m=true`, `k=false`, receives `a(121,8)`, `B=16`, and `r=true`.

Thus `jba` is not a black-box mystery anymore: its control flow and native parameter boundary are recovered. The remaining helper primitives (`tka`, `hob`, `fc`, `eu`, `fra`) are separately source-addressable utilities, not evidence to replace with guessed gameplay behavior.

## Recovered `tka` semantics

Signature:

`tka.a(long seed, byte mode, long scale, int variation, Random random)`

For the only accepted mode (`55`), the generator:

- allocates an integer coordinate array sized from `scale / variation` using native fixed-point arithmetic;
- walks coordinate pairs;
- derives a per-pair seed from `scale` and `random`;
- evaluates the native lookup/math functions `fc.a(angle,-124)` and `eu.a(angle,67)`;
- multiplies those results by the derived seed and shifts right using the native fixed-point constants;
- returns the coordinate array.

The implementation is at `tka.a` bytecode 0–139 in `javap-all.txt`. This is enough to establish the exact generator contract and prevents treating slots 48–55 as static guessed polygons.

## Port consequence

Slots using `jba` must retain the native procedural construction contract. A replacement implementation may use equivalent deterministic geometry generation, but must preserve:

- seed;
- mode;
- scale;
- variation expression;
- supplied shape-array contents/order;
- coordinate fixed-point shifts;
- three generated rows;
- deterministic row seeding from the previous row;
- native output flags/fields recorded above.

No static polygon approximation is authorized by this record.
