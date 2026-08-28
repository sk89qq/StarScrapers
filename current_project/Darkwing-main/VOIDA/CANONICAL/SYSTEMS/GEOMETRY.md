# Canonical Geometry — Components and Hardpoints

## CLOSED-FOR-PORT
- Native 56-slot component allocation is established.
- Static component geometry documented in the source corpus is preserved exactly.
- Polygon-derived mass/COM/inertia inputs are governed by the native geometry, not guessed Roblox shapes.
- Slot 47 is authoritative as an 8-vertex concave polygon; older convex wording is superseded.

## PARTIAL
- Full slot-by-slot native mapping for generated/indirect slots.
- Exact hardpoint candidate filtering/projection where source recovery remains incomplete.
- Native ID-to-Roblox named-component mapping where no direct source proof exists.

## CANONICAL DATA
`DEFINITIVE_VALUES/component_56_slots.csv`

## EVIDENCE
See targeted `wfb`, `wlb`, `ta`, `fnb`, `hab` dumps and the archived component reconciliation reports.
