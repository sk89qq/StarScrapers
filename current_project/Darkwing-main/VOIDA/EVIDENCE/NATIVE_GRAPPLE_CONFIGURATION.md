# Native Grapple Configuration

Recovered from the original-JAR forensic substrate.

| Input | Native holder | Native default | Resolved |
|---|---|---:|---:|
| GRAPPLING_HOOK_AIMSPEED | `ldb.q` | 128 | 128 |
| GRAPPLING_HOOK_AIMARC | `dla.c` | 1024 | 1024 |
| GRAPPLING_HOOK_MAX_LENGTH | `bia.c` | 65000 | 65000 |
| GRAPPLING_HOOK_MIN_LENGTH | `ls.r` | 128 | 128 |
| GRAPPLING_HOOK_FIRE_FORCE | `joa.a` | 1600 | 1600 |
| GRAPPLING_HOOK_SPRING_CONSTANT | `uua.o` | 1000 | 1000 |
| GRAPPLING_HOOK_MAX_EXTENSION8_FORCE | `nra.b` | 1024 | 1024 |
| GRAPPLING_HOOK_COOLDOWN | `oq.t` | `l` | 50 |
| GRAPPLING_HOOK_ROPE_CHANGE_RATE | `ds.d` | 4000 | 4000 |
| GRAPPLING_HOOK_ROPE_BREAK_LENGTH | `bhb.i` | 131072 | 131072 |
| GRAPPLE_DEBRIS | `seb.o` | 0 | 0 |
| PHYSICS_COLLISION_GRAPPLING_HOOK_FORCE_MULTIPLIER | `sja.i` | 4096 | 4096 |
| GRAPPLING_HOOKS_DAMAGEABLE_BY_SOURCE_PLAYER | `gba.r` | 0 | 0 |

## Timing

`GRAPPLING_HOOK_COOLDOWN` is assigned from the native shared timing unit `l`; the canonical resolved value is 50. The source registry also expresses other timings as multiples of `l` (for example `10 * l = 500` and `25 * l = 1250`). This record does **not** invent a seconds conversion for `l`; consumers must use the project's verified native tick/time boundary.

## Source anchors

- `VOIDA/ORIGINAL_JAR/PREPROCESSING_01_06/javap-targeted/fnb.txt` — native static initialization and native constants.
- `VOIDA/CANONICAL/VALUES/GRAPPLE.csv` — canonical resolved subsystem view.
- `VOIDA/CANONICAL/VALUES/NATIVE_ENGINE_INPUTS.csv` — numeric authority.
