--!strict
--[=[
	NativeDebrisBoundary

	Single implementation-facing boundary for recovered debris launch inputs.
	Values remain in native/raw units. Generic body integration and Roblox-unit
	conversion remain outside this module.
]=]

local NativeGameplayConfig = require(script.Parent:WaitForChild("NativeGameplayConfig"))

local NativeDebrisBoundary = {}

export type Config = {
	DetachForceMultiplier: number,
	BreakingExplosionForceMultiplier: number,
	Survives: number,
	MaxDebris: number,
	NativeTickSeconds: number,
}

local CONFIG: Config = {
	DetachForceMultiplier = NativeGameplayConfig.DEBRIS_DETACHMENT_FORCE_MULTIPLIER,
	BreakingExplosionForceMultiplier = NativeGameplayConfig.COMPONENT_BREAKING_EXPLOSION_FORCE_MULTIPLIER,
	Survives = NativeGameplayConfig.DEBRIS_SURVIVES,
	MaxDebris = NativeGameplayConfig.DEBRIS_MAX,
	NativeTickSeconds = 0.02,
}

function NativeDebrisBoundary.GetConfig(): Config
	return table.clone(CONFIG)
end

function NativeDebrisBoundary.GetDetachForceMultiplier(): number
	return CONFIG.DetachForceMultiplier
end

function NativeDebrisBoundary.GetBreakingExplosionForceMultiplier(): number
	return CONFIG.BreakingExplosionForceMultiplier
end

function NativeDebrisBoundary.GetSurvives(): number
	return CONFIG.Survives
end

function NativeDebrisBoundary.GetMaxDebris(): number
	return CONFIG.MaxDebris
end

return NativeDebrisBoundary
