# Generated / Indirect Component Geometry Recovery — 2026-08-28

## Purpose
Advance the P0 generated/indirect component-geometry item using the preserved native JAR disassembly. This record supersedes the earlier claim that the `wlb`/`fnb` generation bodies were unavailable.

## Source anchor
- Native definition builder: `wlb.f(byte)`
- Native generated-geometry helper: `uca.a(int, byte, int[], int)`
- Native procedural shape generator: `jba.a(int[][], long, int, Random, int, long)`
- Native component object: `wfb`
- Native slot table: `VOIDA/CANONICAL/VALUES/COMPONENTS_56.csv`

## Resolved shared transform: `uca.a`

The exact bytecode implementation constructs two 12-element offset tables from `fnb.a` and `fnb.b`.

For the first table `X`:

```text
X = [
  -fnb.b,
  -fnb.a,
  -fnb.b/2,
  0,
  fnb.b/2,
  fnb.a,
  fnb.b,
  fnb.a,
  fnb.b/2,
  0,
  -fnb.b/2,
  -fnb.a
]
```

For the second table `Y`:

```text
Y = [
  0,
  -fnb.b/2,
  -fnb.a,
  -fnb.b,
  -fnb.a,
  -fnb.b/2,
  0,
  fnb.b/2,
  fnb.a,
  fnb.b,
  fnb.a,
  fnb.b/2
]
```

Given seed/base `(x0, y0)` and index list `indices`, the returned polygon is:

```text
out = [x0, y0]
for index in indices:
    x0 = x0 + X[index]
    out.append(x0)
    y0 = y0 + Y[index]
    out.append(y0)
```

The native caller passes byte `9`; any other byte returns null. This is an exact recovered coordinate-generation operator, not an inference.

## Resolved `jba.a` procedural geometry operator

Signature:

```text
jba.a(int[][] outlines, long seed, int mode, Random random, int variation, long scale)
```

Exact recovered behavior:

1. If `outlines` is non-null, use its first outline as the starting polygon and rotate its vertex-pair ordering by moving the final pair to the front repeatedly.
2. Every coordinate in the starting outline is arithmetic-right-shifted by 4 (native `/16` integer scaling).
3. If no outline is supplied, generate a starting polygon from `tka.a(seed, 55, scale, mode, random)`.
4. Allocate three outline layers in the resulting `wfb`.
5. For each of three generated layers, call `tka.a(seed, 55, scale*(2/(layer+2)), mode, per-layer Random)`.
6. Left-shift the generated coordinates by 4 before applying the layer offset.
7. Apply deterministic per-layer offsets derived from the random seed and `scale`.
8. For each vertex, run the native `fra.a(previousLayer, y, x)` collision/validity predicate. If the predicate fails, contract the offending coordinate pair by the native integer factor encoded as `*200 >> constant`.
9. Store all three generated outlines in `wfb.w`.
10. Set `wfb.m=true`, `wfb.k=false`, `wfb.B=16`, `wfb.r=true`, and apply native parameter `wfb.a(121,8)` before returning.

This establishes that slots using `jba.a(...)` are **procedurally generated native geometry**, not static polygons that should be replaced with guessed fixed shapes.

## Generated slot call sites recovered

### Slot 30
Direct constructor already recovered:

```text
new wfb([n6,0,-n6,n5,-n6,-n5], -n6, 0)
```

where the native initialization resolves `n6 = 2217` and `n5 = 2560` from `fnb.a=4434`, `fnb.b=5120` and the native sine initialization. Result:

```text
[2217,0,-2217,2560,-2217,-2560]
```

with native offset `-2217` and `wfb.a=2`.

### Slots 31–41
The `wlb.f(byte)` body has now been recovered far enough to establish that these are native definition objects built from the shared `uca.a` transform and `fnb.a/fnb.b` chassis dimensions, with definition-specific hardpoint/parameter attachments. They must be represented as generated definitions rather than flattened guesses.

Their native definition-table references remain:

```text
31 -> wfb3
32 -> object
33 -> object
34 -> object2
35 -> object
36 -> object
37 -> object
38 -> object
39 -> object
40 -> object
41 -> object
```

The source construction bodies are in the preserved `wlb` disassembly and use the exact `uca.a` operator documented above.

### Procedural slots 48–55
The exact `jba.a` call parameter families recovered from `wlb.f(byte)` are:

| Slot | seed | mode | variation argument | scale |
|---:|---:|---:|---|---:|
| 48 | `1000L` | `12` | `mgb.a(iload_0,47)` | `2500L` |
| 49 | `1000L` | `12` | `mgb.a(iload_0,61)` | `2500L` |
| 50 | `500L` | `12` | `iload_0 + 45` | `1250L` |
| 52 | `500L` | `12` | `mgb.a(iload_0,-10)` | `1250L` |
| 53 | `1500L` | `12` | `-127` | `3000L` |
| 54 | `1500L` | `12` | `123` | `3000L` |
| 55 | `250L` | `10` | `mgb.a(iload_0,-108)` | `625L` |

The first argument for each call is a native `int[][]` outline seed constructed immediately before the call. Those outlines are preserved in the disassembly and are intentionally not flattened here until the complete call-chain is represented.

## Implementation consequence

The Roblox port should expose the native geometry generators as deterministic source operators, not invent replacement geometry. The correct implementation boundary is:

```text
native fnb dimensions
    -> uca index transform
    -> native wfb polygon / offsets / hardpoints
    -> native wfb area/HP operator
    -> Roblox component definition
```

and for procedural definitions:

```text
native outline seed
    -> jba procedural generator
    -> wfb generated outline layers
    -> Roblox component definition
```

Do not use bounding-box dimensions or `Part.Size` as substitutes.

## Status
`PARTIAL / SOURCE-RECOVERY ACTIVE`

The major shared coordinate and procedural operators are now source-recovered. Remaining work is to translate the recovered slot-specific construction bodies into the canonical Roblox component representation and to recover any unresolved `mgb`/`tka` semantics needed for exact runtime generation.
