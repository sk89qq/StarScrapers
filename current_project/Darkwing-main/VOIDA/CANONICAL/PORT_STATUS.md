# DarkWing Port Status — CURRENT SNAPSHOT

**Effective:** 2026-08-28 14:31 CDT

## CLOSED-FOR-PORT
- Mass / component area-derived mass
- Center of mass
- Moment of inertia
- Torque input constants/operator boundary
- Native angle/trig encoding
- Structural authority / transaction model
- Projectile swept-hit implementation boundary

## CURRENTLY RECOVERED / APPLY
- Native implementation-facing value registry
- Substantial fixed component geometry
- Thruster magnitudes and native binding data
- Weapon parameter namespace and recovered values
- Shield native values + runtime boundary integration
- Grapple native values + runtime boundary integration
- Repair values

## OPEN NATIVE/GAMEPLAY WORK
- Generated/indirect component geometry
- Hardpoint filtering/projection where required
- Component damage selection / HP lookup where required
- Weapon consumer semantics
- Thruster gameplay activation/binding semantics
- Power/resource consumer semantics
- Any genuinely unresolved shield/grapple semantics supported by current evidence
- Debris launch scalar/cleanup
- Mission timing/transitions
- Environment/AI behavior needed for the port

## ENGINE-OWNED / DO NOT FORENSICALLY RECONSTRUCT
Generic rigid-body integration, collision/impulse solving, damping, polygon collision math, and generic rope/constraint solving.
