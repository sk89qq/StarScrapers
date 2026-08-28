# Generated / Indirect Component Geometry Recovery — 2026-08-28

## Purpose
Advance the P0 generated/indirect component-geometry item using the preserved native JAR disassembly.

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
X = [-fnb.b, -fnb.a, -fnb.b/2, 0, fnb.b/2, fnb.a,
     fnb.b, fnb.a, fnb.b/2, 0, -fnb.b/2, -fnb.a]
```

For the second table `Y`:

```text
Y = [0, -fnb.b/2, -fnb.a, -fnb.b, -fnb.a, -fnb.b/2,
     0, fnb.b/2, fnb.a, fnb.b, fnb.a, fnb.b/2]
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

The native caller passes byte `9`; any other byte returns null. This is an exact recovered coordinate-generation operator.

## Roblox implementation

`Shared/Combat/NativeComponentGeometry.luau` now exposes the exact `UcaTransform` operator using native 0-based indices and `fnb.a/fnb.b` dimensions. It also exposes the completely resolved slot-30 constructor and records the exact procedural call contracts without inventing unresolved generator semantics.

Slot 30 resolves to:

```text
[2217, 0, -2217, 2560, -2217, -2560]
```

with native offset `-2217` and `wfb.a=2`.

## Procedural `jba.a` contract

Signature:

```text
jba.a(int[][] outlines, long seed, int mode, Random random, int variation, long scale)
```

Recovered call families:

| Slot | seed | mode | variation | scale |
|---:|---:|---:|---|---:|
| 48 | `1000L` | `12` | `mgb.a(iload_0,47)` | `2500L` |
| 49 | `1000L` | `12` | `mgb.a(iload_0,61)` | `2500L` |
| 50 | `500L` | `12` | `iload_0 + 45` | `1250L` |
| 52 | `500L` | `12` | `mgb.a(iload_0,-10)` | `1250L` |
| 53 | `1500L` | `12` | `-127` | `3000L` |
| 54 | `1500L` | `12` | `123` | `3000L` |
| 55 | `250L` | `10` | `mgb.a(iload_0,-108)` | `625L` |

The native implementation produces three generated outline layers, applies native coordinate scaling/offsets, validates vertices through `fra.a`, stores the layers in `wfb.w`, and sets the recovered generated-object flags/parameter. These semantics must not be replaced with guessed fixed polygons.

## Remaining slot construction work

Slots 31–41 are native definition objects built from the shared `uca.a` transform and `fnb.a/fnb.b` chassis dimensions, with definition-specific attachments. Their construction bodies still need to be translated into the canonical Roblox component representation without flattening those attachments.

Slots 48–55 additionally require exact `mgb` and `tka` semantics before runtime generation can be completed. The native `int[][]` outline seed arrays immediately preceding each call also remain to be represented exactly.

## Implementation consequence

Correct boundary:

```text
native fnb dimensions
    -> uca index transform
    -> native wfb polygon / offsets / hardpoints
    -> native wfb area/HP operator
    -> Roblox component definition
```

Procedural:

```text
native outline seed
    -> jba procedural generator
    -> wfb generated outline layers
    -> Roblox component definition
```

Do not use bounding-box dimensions or `Part.Size` as substitutes.

## Status
`PARTIAL / IMPLEMENTATION ADVANCED`

The exact shared coordinate operator and resolved slot-30 constructor are implemented. Exact procedural call contracts are represented without inventing unresolved behavior. Remaining work is slot-specific construction for 31–41, exact outline seeds for 48–55, and source recovery of `mgb`/`tka` semantics needed for runtime procedural generation.
