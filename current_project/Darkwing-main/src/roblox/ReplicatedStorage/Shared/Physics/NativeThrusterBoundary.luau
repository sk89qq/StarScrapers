--!strict
-- NativeThrusterBoundary
-- Implementation-facing boundary for recovered native thruster gameplay inputs.
-- Native values are kept in native units; conversion/engine application remains downstream.
-- SOURCE: CANONICAL/VALUES/THRUSTERS.csv; NativeThrusterOperator/aqua force mapping.

local NativeThrusterOperator = require(script.Parent.NativeThrusterOperator)

local NativeThrusterBoundary = {}

export type ThrusterKind = "Small" | "Main" | "Booster"

local COMPONENT_TYPE_BY_KIND: { [ThrusterKind]: number } = {
	Small = 12, -- clb.a
	Main = 13, -- pwa.b
	Booster = 46, -- enb.c
}

local KIND_BY_COMPONENT_TYPE: { [number]: ThrusterKind } = {
	[12] = "Small",
	[13] = "Main",
	[46] = "Booster",
}

function NativeThrusterBoundary.GetComponentType(kind: ThrusterKind): number
	return COMPONENT_TYPE_BY_KIND[kind]
end

function NativeThrusterBoundary.GetKind(componentType: number): ThrusterKind?
	return KIND_BY_COMPONENT_TYPE[componentType]
end

function NativeThrusterBoundary.GetForceScale(kind: ThrusterKind): number
	return NativeThrusterOperator.GetForceScale(COMPONENT_TYPE_BY_KIND[kind])
end

function NativeThrusterBoundary.Compute(kind: ThrusterKind, nativeMagnitude: number, angleUnits: number)
	return NativeThrusterOperator.Compute(COMPONENT_TYPE_BY_KIND[kind], nativeMagnitude, angleUnits)
end

function NativeThrusterBoundary.IsInnateEnabled(): boolean
	return true -- INNATE_THRUSTERS=1
end

function NativeThrusterBoundary.IsAutobalancingEnabled(): boolean
	return true -- THRUSTER_AUTOBALANCING=1
end

function NativeThrusterBoundary.HasOppositeMoveAndTurn(): boolean
	return true -- THRUSTER_BINDING_MOVE_AND_TURN_HAS_OPPOSITE_MOVE=1
end

function NativeThrusterBoundary.GetBalanceThreshold(): number
	return 8 -- THRUSTER_BINDING_BALANCE_THRESHOLD
end

return NativeThrusterBoundary
