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

Independent gameplay timing anchors now establish the shared native timing unit as:

**`1 l = 1.0 second`**

Evidence anchor: the native Pedro repair active-time value is `5 * l`; observed gameplay behavior is a 5-second repair channel/active interval. Therefore `5l = 5s`, giving `1l = 1s`.

This converts the recovered native timing expressions as follows:

- `1l` = 1 second
- `5l` = 5 seconds
- `10l` = 10 seconds
- `20l` = 20 seconds
- `25l` = 25 seconds
- `40l` = 40 seconds

This is a gameplay timing-unit calibration, not a claim that `l` equals one simulation frame. The repository's resolved numeric representation (for example `1l = 50`) must not be interpreted as milliseconds.

The grapple cooldown therefore resolves to **1 second** because `GRAPPLING_HOOK_COOLDOWN = 1l`.

Other independently observed gameplay anchors should be used to validate this conversion before treating it as universal across every native subsystem.

## Source anchors

- `VOIDA/ORIGINAL_JAR/PREPROCESSING_01_06/javap-targeted/fnb.txt` — native static initialization and native constants.
- `VOIDA/CANONICAL/VALUES/GRAPPLE.csv` — canonical resolved subsystem view.
- `VOIDA/CANONICAL/VALUES/NATIVE_ENGINE_INPUTS.csv` — numeric authority.
- Native Pedro repair timing record — `PEDROS_REPAIR_MODE_ACTIVE_TIME = 5l`, matched to the observed 5-second channel.
