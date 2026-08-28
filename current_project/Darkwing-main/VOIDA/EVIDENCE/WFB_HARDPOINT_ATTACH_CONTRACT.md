# Native `wfb.a(int, lsb)` Hardpoint Attachment Contract — 2026-08-28

## Source
Original-JAR targeted bytecode:
`ORIGINAL_JAR/PREPROCESSING_01_06/javap-targeted/wfb.txt`

## Exact behavior

Native signature:

```text
final void a(int key, lsb hardpoint)
```

The method performs one integer calculation into a local variable:

```text
local = 34 / ((-69 - key) / 44)
```

That local is never subsequently read by the method. It has no effect on the attachment operation.

The actual state transition is therefore exactly:

```text
if o == null:
    o = new lsb[1]
    o[0] = hardpoint
else:
    next = new lsb[o.length + 1]
    copy o[0..length-1] into next
    next[o.length] = hardpoint
    o = next
```

No key-based filtering, projection, deduplication, replacement, or coordinate transformation occurs here.

## Consequence

The previously unresolved `wfb.a(int,lsb)` filtering/projection question is now resolved: **the integer attachment key is behaviorally inert in this method**. The hardpoint is appended verbatim to `wfb.o`.

Therefore the canonical port should preserve:

- hardpoint ordering;
- every `lsb` record exactly;
- the supplied attachment key as source metadata if useful for provenance, but not as a runtime filter;
- no invented projection logic at this boundary.

## Related scaling boundary

`wfb.a(int,int,boolean)` separately shifts `lsb.b` and `lsb.c`; `lsb.a` is not shifted. That operation is independent of attachment insertion.

## Status
`RESOLVED / IMPLEMENTATION-READY`
