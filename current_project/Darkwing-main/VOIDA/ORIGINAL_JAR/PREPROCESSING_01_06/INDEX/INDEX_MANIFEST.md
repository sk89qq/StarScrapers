# Steps 1–6 Index Manifest

Generated: 2026-08-27

## Source JAR
- path: ../voidhunters-original.jar
- sha256: 4bb086ef9b0ec1f6f5362df92d634a2b4d997b4b5037f213fd3d5e5ea219bba4
- size_bytes: 2325563
- exact `.class` entries in JAR: 1570

## Mechanical indexes
- CLASS_INDEX.tsv: 1570 exact JAR class entries
- PACKAGE_INDEX.tsv: 7 packages
- FIELD_INDEX.tsv: extracted field declarations from available javap class declarations
- METHOD_INDEX.tsv: extracted method declarations from available javap class declarations
- METHOD_REFERENCE_INDEX.tsv: bytecode method-reference comments grouped by caller declaration
- FIELD_REFERENCE_INDEX.tsv: bytecode field-reference comments grouped by caller declaration
- STRING_LITERAL_INDEX.txt: quoted strings visible in javap output
- BYTECODE_OPCODE_FREQUENCY.tsv: opcode frequency in the javap dump

## Raw evidence
- ../javap-all.txt sha256: a094979f00ab55aa93ed54eb1ae32c4122c348dc81db8efee9d6cfa1d9209dd9
- ../unpacked-classfiles.tar.gz sha256: 9654515e5d4e1df3deece5f98aa4f80cfca3e117fbbc99c38c05c036bfb995e3

## Important scope statement
The exact class count comes from the original JAR ZIP directory, not from a regex over javap output.
Some native/interface class declarations are not represented by the simple declaration parser used for FIELD_INDEX/METHOD_INDEX. Those indexes are therefore extraction aids, not claims of complete member coverage.

Authority:
1. Original Void Hunters JAR / classfiles
2. javap output generated from that JAR
3. decompiler output, when supplied, as a readability aid
4. forensic interpretation
5. DarkWing implementation

DarkWing is not an authority over the original game.
