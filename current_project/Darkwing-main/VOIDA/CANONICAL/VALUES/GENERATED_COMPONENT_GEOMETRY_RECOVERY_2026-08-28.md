# Generated Component Geometry Recovery — 2026-08-28

## Scope
This record advances P0 generated/indirect component geometry recovery from the preserved original JAR bytecode. It is evidence-first: recovered bytecode facts are recorded without inventing Roblox component mappings.

## Binary/source anchor
- Native class: `wlb`
- Generated component array: `hab.g`
- Generator support class: `fnb`
- Native component array length: 56
- Original JAR SHA-256: `4bb086ef9b0ec1f6f5362df92d634a2b4d997b4b5037f213fd3d5e5ea219bba4`

## Exact `fnb` static values
The preserved `fnb` bytecode static initializer establishes:

```text
fnb.b = 5120
fnb.a = (int)(5120 * sin(1.0471975511965976))
```

The angle literal is π/3. Therefore the native integer value is:

```text
fnb.a = 4434
fnb.b = 5120
```

These are fixed native generator inputs, not runtime Roblox tuning values.

## Slot 30 — exact generated initializer recovered
The `wlb` bytecode establishes:

```text
n1 = 2560
n2 = (int)(n1 * sin(1.0471975511965976))
n3 = 1365

slot 30 = new wfb(
    new int[]{ n2, 0, -n2, n1, -n2, -n1 },
    -n2,
    0
)
```

The resulting integer is:

```text
n2 = 2217
```

so the native polygon is exactly:

```text
{2217, 0, -2217, 2560, -2217, -2560}
```

The same constructor path then adds four native `lsb` hardpoint/behavior records, applies native values `106/15`, and sets `wfb.a = 2`. Those behavior attachments are intentionally not translated into Roblox component semantics here.

## Slots 48–55 — direct generated-shape arrays recovered
The `wlb` bytecode directly constructs all eight `jba.a(...)` inputs for slots 48–55. These are not placeholders: each is a concrete `int[][]` polygon/shape input plus native scalar arguments.

Recovered call signatures:

```text
slot 48: jba.a(array3, 1000L, 12, random, mgb.a(0,47), 2500L)
slot 49: jba.a(array3, 1000L, 12, random, mgb.a(0,61), 2500L)
slot 50: jba.a(array3, 500L,  12, random, 45 + mgb.a(0,45), 1250L)
slot 52: jba.a(array3, 500L,  12, random, ..., 1250L)
slot 53: jba.a(array3, 500L,  12, random, ..., 1250L)
slot 54: jba.a(array3, 500L,  12, random, ..., 1250L)
slot 55: jba.a(array3, 500L,  12, random, ..., 1250L)
```

Slots 51 remains a direct `wfb` construction in the canonical slot table. The bytecode sequence around slots 48–55 shows these definitions belong to the generated terrain/chassis-like family already identified by the forensic reconciliation ledger.

## Important boundary
`jba.a(...)` is a native constructor/operator boundary. Recovering its polygon inputs is not sufficient to claim that the resulting object is a normal ship component or to infer its Roblox `ComponentType`. The consumer semantics and native mapping must still be established.

## P0 conclusion
The previous blocker was not a missing binary. The original JAR and targeted `wlb`/`fnb` bytecode are preserved in the imported forensic corpus. We have now recovered:

1. the exact fixed `fnb.a/fnb.b` generator constants;
2. the complete slot-30 polygon expression and evaluated integer polygon;
3. direct `jba.a(...)` construction evidence for slots 48–55;
4. the fact that generated definitions must remain native-operator-backed rather than being flattened into guessed Roblox shapes.

## Remaining P0 source-recovery work
- Fully symbolically reconstruct slots 31–41 from their bytecode-local expressions, including every `fnb.a/fnb.b` dependency and `wfb` field override.
- Resolve `jba.a(...)` itself sufficiently to distinguish polygon input, generated hardpoints, health scaling, and any randomized construction semantics.
- Only after those are recovered, map native slots to Roblox component names using direct source evidence rather than declaration order.

## Future agent rule
Do not mark slots 31–41 or 48–55 as Roblox-parity complete merely because their bytecode is present. Mark the native geometry expressions recovered only when every coordinate/operator input is accounted for; mark Roblox parity only after native-ID-to-component mapping is independently proven.
