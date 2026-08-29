# Port Physics Definitions — Definitive

## Canonical timing and numeric conventions

- Base simulation cadence: **30 Hz**.
- Native gameplay duration: **1l = 1 second**.
- Fixed-point numeric representation: **Q16**, where **65536 = 1.0**.
- Damage normalization: **2048 native damage units** is the canonical normalized damage scale; health and damage use the same scale, so no real-world HP conversion is required.

## Energy subsystem

- Player-facing energy is a **0–100% visual representation**; the original UI does not require a numeric gameplay-facing scale.
- Energy is governed by the **capacitor subsystem and its sources**.
- Recharge is **simulation-tick based and continuous**.
- Recharge does not stop merely because weapons are firing.
- When energy falls below the weapon-fire threshold, the system enters its depleted/recharge state; the capacitor must **fully recharge before weapons become fireable again**.
- Individual weapon energy costs consume the shared subsystem resource; do not invent a separate real-world energy unit.

## Spatial representation

- For the port, **1 native position/distance unit = 1 port spatial unit**.
- Preserve all relative positions, ranges, radii, offsets, and geometry directly.
- No meter/foot/world-scale conversion is required.

## Velocity and acceleration

- Preserve native relative velocity values; no real-world speed conversion is required.
- Projectile speeds are fixed per projectile type unless the native behavior explicitly supplies a different motion model.
- The player ship is the principal variable-velocity craft: propulsion/graph/thruster configuration changes its velocity state.
- Fighter AI uses its own vector/impulse movement behavior rather than the fixed-projectile-speed model.
- Native acceleration-bearing fields are the acceleration inputs. Do **not** introduce an external universal acceleration constant.
- Integrate velocity and position through the authoritative simulation cadence while preserving the native relative scales.

## Angular representation

- Native angular quantities use the standardized angular/fixed-point representation.
- `AIMSPEED` is **weapon angular traverse/aiming speed**, not fire rate.
- `AIMARC` is the weapon's angular aiming envelope/limit.
- `AIMSPEED = 0` identifies the recovered fixed/non-pivoting weapon modules.
- Nonzero `AIMSPEED` identifies traversable/pivoting weapon behavior.

## Projectile timing

Projectile `LIFE` values that are native 30-Hz counters convert as:

`seconds = LIFE / 30`

Examples from the canonical registry:

- Bomblet `LIFE=25` → **0.8333 s**
- Sniper `LIFE=50` → **1.6667 s**
- Countermeasure `LIFE=100` → **3.3333 s**
- Torpedo/Missile `LIFE=500` → **16.6667 s**
- Mass Driver `2*l` → **2.0 s**

These conversions use the established timing definition; no additional projectile clock is introduced.

## Implementation principle

The port should reproduce the game's **relative state transitions and numeric relationships**, not impose real-world SI units that the original gameplay does not expose or require.
