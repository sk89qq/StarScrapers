# Native Hardpoint Record — `lsb`

Source: original-JAR targeted bytecode `lsb.txt` and `wfb.txt`.

## `lsb` field layout

Native constructor:

```text
lsb(int first, int second, int third)
```

The bytecode assigns:

```text
c = second
b = first
a = third
```

Therefore the constructor's three arguments are not stored in declaration order. The authoritative field mapping is:

| Constructor argument | Native field |
|---:|---|
| first | `b` |
| second | `c` |
| third | `a` |

## Observed native hardpoint construction

`wfb` slot 31 attaches `lsb` objects through `wfb.a(int, lsb)` rather than encoding them into the polygon vertex array. The recovered slot-31 construction includes these native attachment records:

```text
lsb(5, 0, 0)
lsb(2, -2, -2048)
lsb(2, 2, 2048)
lsb(-1, 0, 0)
lsb(-5, 0, 4096)
```

## Attachment-key semantics — resolved

The integer supplied to `wfb.a(int, lsb)` is **not used to filter, project, or select the hardpoint**. The method computes a local integer from that argument, but that value is never subsequently read. The method then either creates the hardpoint array or allocates a one-element-larger array, copies the existing entries in order, appends the supplied `lsb`, and stores the new array.

Therefore the authoritative behavior is simply ordered append. The attachment key must not be treated as a spatial/filtering key in the port.

## Scaling behavior

`wfb.a(int, int, boolean)` scales hardpoint fields `lsb.b` and `lsb.c` by the native power-of-two shift. `lsb.a` is not scaled by that operation. This establishes that the first two constructor arguments represent the spatial hardpoint components, while the third is a separate native hardpoint parameter.

## Porting consequence

Hardpoints must remain separate component metadata. They must not be flattened into polygon vertices or reconstructed from bounding boxes. Preserve the native `lsb` fields and their insertion order. Do not implement attachment-key filtering or projection.

## Status
`RESOLVED`
