# Void Hunters Forensic Source Ledger — Steps 1–6

STATUS: GENERATED SOURCE INDEX / EVIDENCE ONLY

Authority:
- The original Void Hunters JAR is the absolute behavioral and architectural authority.
- These files are mechanically derived from that JAR and its `javap` output.
- DarkWing is an implementation destination, not an authority.
- Do not rename an obfuscated field/method into a semantic name unless independently verified.
- Do not treat a decompiler's reconstruction as authoritative over JVM bytecode.

Contents:
- CLASS_INDEX.tsv: class declarations recovered from the complete javap dump.
- FIELD_INDEX.tsv: field declarations plus JVM descriptors.
- METHOD_INDEX.tsv: method signatures plus JVM descriptors.
- METHOD_REFERENCE_INDEX.tsv: bytecode method-reference comments grouped by caller class.
- FIELD_REFERENCE_INDEX.tsv: bytecode field-reference comments grouped by caller class.
- STRING_LITERAL_INDEX.txt: quoted string literals visible in javap output.
- ../javap-all.txt: complete generated javap dump for the indexed JAR.
- ../unpacked-classfiles.tar.gz: preserved unpacked classfiles.
- ../voidhunters-original.jar: preserved original JAR.

Generation rule:
All index rows are extraction artifacts. They are not semantic claims about gameplay.

Verification:
The preserved JAR SHA-256 is recorded in ../SHA256.txt.
