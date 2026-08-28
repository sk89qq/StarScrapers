# Generated Component Geometry — Slots 48–55

**Source:** `VOIDA/ORIGINAL_JAR/PREPROCESSING_01_06/javap-targeted/wlb.txt`
**Status:** RECOVERED FORENSIC INPUTS; runtime implementation pending helper-semantics verification.

The native constructor for these slots is `jba.a([[I, long, int, Random, int, long):wfb`. The three polygon/point arrays are literal integer arrays in the original bytecode; the invocation parameters below are recovered directly from the bytecode and must not be replaced with guessed gameplay values.

| Slot | Native call tail (exact) | Recovered selector / seed | Native scale | Notes |
|---|---|---|---:|---|
| 48 | `1000L, 12, Random, mgb.a(iload_0,47), 2500L` | `mgb.a(index,47)` | 1000 / 2500 | Three-array geometry literal immediately precedes call. |
| 49 | `1000L, 12, Random, mgb.a(iload_0,61), 2500L` | `mgb.a(index,61)` | 1000 / 2500 | Three-array geometry literal immediately precedes call. |
| 50 | `500L, 12, Random, iload_0 + 45, 1250L` | `index + 45` | 500 / 1250 | Three-array geometry literal immediately precedes call. |
| 51 | `500L, 12, Random, mgb.a(iload_0,-10), 1250L` | `mgb.a(index,-10)` | 500 / 1250 | Three-array geometry literal immediately precedes call. |
| 52 | `1500L, 12, Random, -127, 3000L` | `-127` | 1500 / 3000 | Three-array geometry literal immediately precedes call. |
| 53 | `1500L, 12, Random, 123, 3000L` | `123` | 1500 / 3000 | Three-array geometry literal immediately precedes call. |
| 54 | `250L, 10, Random, mgb.a(iload_0,-108), 625L` | `mgb.a(index,-108)` | 250 / 625 | Three-array geometry literal immediately precedes call. |
| 55 | `250L, 10, Random, 122, 625L` | `122` | 250 / 625 | Three-array geometry literal immediately precedes call. |

## Native arrays

The original bytecode contains literal array lengths and values for every slot. Their construction must be preserved exactly from `wlb.txt`; do not synthesize replacement coordinates. The calls are stored directly into `hab.g[48]` through `hab.g[55]`.

## Helper boundary

`mgb.a(int,int)` is part of the native procedural seed/selection path. Until its exact semantics are recovered, the Roblox port should expose the recovered selector as a native-boundary input rather than reinterpret it as an arbitrary random seed. Likewise, `jba.a` remains a native geometry constructor boundary; engine-side polygon handling should consume its resulting geometry without replacing the native construction with a different procedural algorithm.

## Next implementation step

1. Extract the literal arrays for each of 48–55 into the canonical data registry.
2. Implement a `NativeGeneratedComponentGeometry` boundary that preserves the three-array grouping and the exact `jba.a` call parameters.
3. Resolve `mgb.a` semantics from the original-JAR helper before converting selector calls into runtime seed logic.
4. Add acceptance fixtures comparing generated integer arrays and constructor metadata to the recovered source evidence.
