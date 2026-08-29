# P0 Procedural Geometry Resolution — Slots 48–55

Status: **RESOLVED FROM ORIGINAL BYTECODE**

## `jba` behavior

For a non-null `int[][]` geometry input, `jba.a(int[][], long, int, Random, int, long)` does **not** procedurally regenerate the supplied geometry. It operates on the first polygon array and then installs the remaining arrays unchanged as the returned `wfb.w` geometry set.

For the first polygon, the bytecode performs:

1. Pairwise reversal/reordering of the coordinate pairs.
2. Arithmetic right shift of every coordinate by 4 (`>> 4`).
3. The resulting first polygon is the primary polygon of the returned `wfb`.
4. Input arrays 1..N are retained unchanged as the remaining polygon/geometry arrays.

Thus the `seed`, `variation`, and `scale` arguments are **not used to regenerate these eight supplied geometries** when the first `int[][]` argument is non-null. The apparently procedural calls are therefore fully resolvable from their literal source arrays plus the `jba` operator.

## Materialized primary polygons

Coordinates are stored as `[x0,y0,x1,y1,...]` after the exact Java `>> 4` operation.

| Slot | Resolved primary polygon |
|---:|---|
| 48 | `[1108,-2761,2279,-3180,2823,-2740,3555,-1506,3325,209,2405,1338,669,2907,-356,2384,-2510,1338,-3054,209,-2698,-1506,-2719,-2740,-1799,-3180,-21,-2761]` |
| 49 | `[1380,-3180,2886,-3368,3513,-3033,2865,-2259,2865,-1339,2028,1275,-544,1275,-1841,627,-3117,-1339,-3033,-2259,-1862,-3033,-1611,-3368,-293,-3180]` |
| 50 | `[815,-858,1819,-1485,2133,-1151,1317,1903,439,1903,-628,439,-1674,-1151,-1381,-1485,-42,-858]` |
| 52 | `[1547,-3159,2467,-3472,2572,-3389,3325,-2949,3179,-2113,3513,-1255,2572,481,1213,2509,-837,2509,-1695,2321,-3012,481,-3849,-1255,-3556,-2113,-2489,-2949,-2343,-3389,-1527,-3472,62,-3159]` |
| 53 | `[2007,-3765,2928,-3995,4433,-3974,4183,-2970,4852,-2343,4015,125,1840,2216,83,3555,-2008,2551,-2427,2216,-3828,125,-4644,-2343,-3932,-2970,-2489,-3974,-1904,-3995,-63,-3765]` |
| 54 | `[648,-534,705,-706,5,366,-696,-319,-696,-706,-231,-534]` |
| 55 | `[261,-706,800,-712,669,413,-408,413,-790,-351,-800,-712,-241,-706]` |

## Source-call correction

The original `wlb` bytecode proves slot **48** uses:

`jba.a(base, 1000L, 12, random, mgb.a(iload_0, 47), 2500L)`

not `mgb.a(iload_0, 61)`. The canonical component table has been corrected accordingly.

Slots 49, 50, 52, 53, 54, and 55 retain their bytecode-proven argument expressions.

## Remaining geometry data

For each of these slots, the literal source arrays after the first array are already direct geometry inputs and are retained unchanged by `jba`. Therefore no unresolved `jba` geometry value remains for slots 48–55.

The separate `tka` procedural generator remains documented because it is the null-input branch of `jba`; it is not needed to resolve these eight slots because all eight calls supply non-null literal geometry arrays.
