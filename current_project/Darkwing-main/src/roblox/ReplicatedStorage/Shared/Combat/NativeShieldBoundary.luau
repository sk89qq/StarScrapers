--!strict
--[=[
	NativeShieldBoundary

	Single implementation-facing boundary for shield inputs recovered from the
	original native registry. Values are raw native units; this module does not
	invent shield capacity, regeneration, reboot, or Roblox-unit conversions.
]=]

local NativeGameplayConfig = require(script.Parent.NativeGameplayConfig)

local NativeShieldBoundary = {}

export type Config = {
	ToggleCooldown: number,
	DirectionalIdleEnergyUsage: number,
	DirectionalRadius: number,
	DirectionalArc: number,
	DamageEnergyConversion: number,
	NativeTickSeconds: number,
}

local CONFIG: Config = {
	ToggleCooldown = NativeGameplayConfig.SHIELDS_TOGGLE_COOLDOWN,
	DirectionalIdleEnergyUsage = NativeGameplayConfig.SHIELDS_DIRECTIONAL_IDLE_ENERGY_USAGE,
	DirectionalRadius = NativeGameplayConfig.SHIELDS_DIRECTIONAL_RADIUS,
	DirectionalArc = NativeGameplayConfig.SHIELDS_DIRECTIONAL_ARC,
	DamageEnergyConversion = NativeGameplayConfig.SHIELDS_DAMAGE_ENERGY_CONVERSION,
	-- Native l is 50 time units and the recovered shield toggle expression is l/2 = 25.
	-- The runtime uses the recovered 50 ticks/second native cadence at this boundary.
	NativeTickSeconds = 0.02,
}

function NativeShieldBoundary.GetConfig(): Config
	return table.clone(CONFIG)
end

function NativeShieldBoundary.GetToggleCooldown(): number
	return CONFIG.ToggleCooldown
end

function NativeShieldBoundary.GetDirectionalRadius(): number
	return CONFIG.DirectionalRadius
end

function NativeShieldBoundary.GetDirectionalArc(): number
	return CONFIG.DirectionalArc
end

function NativeShieldBoundary.GetIdleEnergyUsagePerTick(): number
	return CONFIG.DirectionalIdleEnergyUsage
end

function NativeShieldBoundary.GetDamageEnergyCost(rawDamage: number): number
	if rawDamage <= 0 then
		return 0
	end
	return rawDamage / CONFIG.DamageEnergyConversion
end

function NativeShieldBoundary.GetNativeTickSeconds(): number
	return CONFIG.NativeTickSeconds
end

return NativeShieldBoundary
