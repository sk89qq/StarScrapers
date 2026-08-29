# Port Physics Definitions — Definitive

## Canonical timing and numeric conventions

- Base simulation cadence: **30 Hz**.
- Native gameplay duration: **1l = 1 second**.
- Fixed-point numeric representation: **Q16**, where **65536 = 1.0**.
- Damage/health use the same native scale; damage is **direct subtraction from the target part's health**. No separate damage-to-HP conversion is required.
- Q16 arithmetic is the canonical numeric domain for fixed-point quantities; preserve native relative values rather than introducing SI conversions.

## Energy subsystem

- Player-facing energy is a **0–100% visual representation**.
- All weapon energy draws from **one shared energy pool** governed by the capacitor subsystem and its sources.
- Recharge is **tick based and occurs once per 30-Hz simulation tick**.
- Recharge is continuous and does not stop merely because weapons are firing.
- When energy falls below the fireability threshold, weapons enter the depleted/recharge lockout state and become fireable again only after the required **full recharge** state.
- Capacitor/source values are therefore interpreted as per-tick contributions/capacity values in the native numeric domain; no separate real-world energy unit is required.

## Spatial representation

- **1 native position/distance unit = 1 port spatial unit** for this port.
- Preserve relative positions, ranges, radii, offsets, and geometry directly.
- No meter/foot/world-scale conversion is required.

## Velocity and acceleration

- Preserve native relative velocity values; no real-world speed conversion is required.
- Projectile speeds are fixed per projectile type unless native behavior explicitly supplies a different motion model.
- The player ship is the principal variable-velocity craft: its propulsion/thruster configuration changes its velocity state.
- Fighter AI uses vector/impulse movement rather than the fixed-projectile-speed model.
- Native acceleration-bearing fields are the acceleration inputs. No external universal acceleration constant is introduced.
- Propulsion is **graph based**: the propulsion component applies force at its defined point in the component graph, affecting the connected physical body.
- Motion is integrated on the authoritative 30-Hz simulation cadence.

## Angular representation

- Native angular quantities use the standardized angular/fixed-point representation.
- `AIMSPEED` is weapon angular traverse/aiming speed, not fire rate.
- `AIMARC` is the weapon's angular aiming envelope/limit.
- `AIMSPEED = 0` identifies the recovered fixed/non-pivoting weapon modules.
- Nonzero `AIMSPEED` identifies traversable/pivoting weapon behavior.

## Recoil / weapon mass

- `FIRE_FORCE` produces recoil opposite the projectile's travel vector.
- Recoil is applied at the weapon/component attachment point in the component graph.
- No native weapon mass/weight field has been recovered. **Weapons are therefore definitive weightless attachment nodes for the port.**
- Recoil from a weightless weapon propagates through its connection to the physical component/body.

## Projectile timing

Projectile `LIFE` values that are native 30-Hz counters convert as:

`seconds = LIFE / 30`

No additional projectile clock is introduced.

## Integration conventions

- Energy regeneration: once per simulation tick.
- Shield depletion/recharge: once per simulation tick using the same 30-Hz cadence.
- Damage application: direct `part.health -= damage` in the shared native health/damage scale.
- Shared energy pool: all weapon consumption and capacitor/source regeneration operate on the same resource.
- Relative spatial/velocity values remain native; physical-world units are not required for faithful gameplay behavior.
