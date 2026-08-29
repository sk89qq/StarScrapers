# Weapon Physics Definitions — Definitive Port Rules

## Weapon mass / recoil body

No native weapon/component weight or mass field has been recovered in the canonical component/weapon data. For the port, weapons are therefore treated as **weightless attachment nodes**, not independent dynamic bodies.

Recoil from `FIRE_FORCE` is consequently applied to the **physical connecting component/body at the weapon's attachment point**. The recoil vector is opposite the projectile travel vector. This preserves the native graph-based physical behavior without inventing weapon mass.

If a later native mass field is recovered, it supersedes this port rule.

## Recoil operator

For a projectile with normalized travel direction `d` and weapon fire force `F`:

`recoil_vector = -d * F`

Apply that impulse/force at the weapon attachment point on the owning physical component/body. A mathematically equivalent native operator is acceptable if it produces the same reverse-vector result.

## Propulsion

Player propulsion is **component-graph based**. Thruster configuration supplies force at the corresponding point on the component graph; the resulting force changes the craft's velocity through the normal simulation integration. Do not model propulsion as a global acceleration constant.

## Projectile motion

Normal weapon projectiles use their defined fixed-speed motion. Fighter AI is a separate vector/impulse movement model.

## Timing

All force/velocity integration occurs within the authoritative **30 Hz simulation cadence**. Native Q16 numeric values remain in their established fixed-point representation.
