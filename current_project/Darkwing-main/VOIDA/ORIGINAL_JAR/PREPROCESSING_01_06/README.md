# Void Hunters preprocessing — steps 1–6

## Authority
`voidhunters-original.jar` is the preserved original Void Hunters JAR supplied to the project. Its SHA-256 is recorded in `SHA256.txt` and is the absolute behavioral/architectural authority.

DarkWing is the implementation tree only. If DarkWing differs from this JAR, the JAR wins.

## Completed preprocessing
1. Source JAR located/preserved.
2. SHA-256 verified and recorded.
3. JAR unpacked without modifying the source archive.
4. Complete 1,570-class/file inventory generated.
5. Relevant forensic classes identified for the current architecture pass; see `relevant-classes.txt`.
6. Complete `javap -c -p -s -constants` output generated for all 1,570 classes in `javap-all.txt`.

`javap-targeted/` contains separate files for the currently active forensic classes so they are easy to inspect.

## Decompiler input
A human-readable decompiled Java tree can be added here later. It is a convenience/reference layer only; raw JAR, extracted classfiles, and JVM bytecode remain authoritative.
