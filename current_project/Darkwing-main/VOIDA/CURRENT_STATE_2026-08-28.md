# DarkWing / Void Hunters — Current Forensic Snapshot

**Snapshot time:** 2026-08-28 14:31 CDT  
**Starting point:** This document defines the current working state. Earlier notes are historical evidence only unless explicitly promoted here.

## Operating rule

Start from `FORENSIC_MASTER.md`. The `CANONICAL/` layer is the active forensic record. `ARCHIVE/` and `ORIGINAL_JAR/PREPROCESSING_01_06/` are consulted only to prove or resolve an active item. Do not infer closure from historical notes.

## Current authority

1. Original `voidhunters.jar` (SHA-256 `4bb086ef9b0ec1f6f5362df92d634a2b4d997b4b5037f213fd3d5e5ea219bba4`).
2. JAR-derived bytecode/decompilation.
3. Current canonical forensic tables and system records.
4. Historical/archive material only for provenance.

## Current closed-for-port subjects

- Component mass / area-derived mass.
- Center of mass.
- Moment of inertia.
- Torque input constants/operator boundary.
- Native angular encoding/trig representation.
- Structural authority/transaction boundary.
- Projectile swept-hit implementation boundary.
- Network/server authority architecture as an implementation concern.

## Current recovered native input families

- Component geometry: substantial fixed geometry recovered; generated/indirect definitions remain active where needed.
- Thruster force/binding values.
- Weapon timing, aim, force, projectile, damage and resource values.
- Shield values.
- Grapple values.
- Repair values.
- Mission/environment values.
- Collision/debris constants.

## Current active forensic work

- Generated/indirect component geometry required by the port.
- Exact hardpoint projection/filtering where needed.
- Exact component damage selection and HP lookup where still native-specific.
- Weapon consumer semantics only where required to interpret an input.
- Thruster gameplay binding/activation semantics where required.
- Power/resource consumer semantics where required.
- Shield/grapple native boundaries and current runtime consumer integration are implemented; only acceptance verification or a new evidence-backed gap remains.
- Debris launch scalar/remaining native gameplay parameters.
- Mission transitions/timing and environment behavior.

## Explicitly not active

Generic rigid-body solver, generic collision/impulse solver, generic constraint/rope solver, generic damping/integration, and other replacement-engine internals.

## Snapshot principle

This is the state from which future forensic work should restart. Preserve historical evidence, but do not carry historical queues forward merely because they exist. Every completed subject should be represented once in the canonical layer.
