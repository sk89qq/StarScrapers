--!strict
--[=[
	ShieldSystem

	Compatibility/runtime model for callers that need an isolated shield object.
	Native shield semantics are sourced exclusively from NativeShieldBoundary.
	This module intentionally does not synthesize shield HP, regeneration, reboot
	delays, damage-type modifiers, or fallback radii.
]=]

local NativeShieldBoundary = require(script.Parent:WaitForChild("NativeShieldBoundary"))

local ShieldSystem = {}
ShieldSystem.__index = ShieldSystem

export type Shield = {
	MaxEnergy: number,
	CurrentEnergy: number,
	IsActive: boolean,
	Radius: number,
	Arc: number,
	ToggleCooldown: number,
	LastToggleTime: number,
	IdleAccumulator: number,
}

function ShieldSystem.new(maxEnergy: number, initialActive: boolean?): Shield
	assert(typeof(maxEnergy) == "number" and maxEnergy >= 0, "ShieldSystem.new requires explicit maxEnergy")
	local native = NativeShieldBoundary.GetConfig()
	return setmetatable({
		MaxEnergy = maxEnergy,
		CurrentEnergy = maxEnergy,
		IsActive = initialActive == true,
		Radius = native.DirectionalRadius,
		Arc = native.DirectionalArc,
		ToggleCooldown = native.ToggleCooldown,
		LastToggleTime = -math.huge,
		IdleAccumulator = 0,
	}, ShieldSystem)
end

function ShieldSystem:CanToggle(): boolean
	return os.clock() - self.LastToggleTime >= self.ToggleCooldown * NativeShieldBoundary.GetNativeTickSeconds()
end

function ShieldSystem:SetActive(active: boolean, force: boolean?): boolean
	if not force and not self:CanToggle() then
		return false
	end
	if active and self.CurrentEnergy <= 0 then
		return false
	end
	self.IsActive = active
	self.LastToggleTime = os.clock()
	return true
end

function ShieldSystem:AbsorbDamage(rawDamage: number): number
	if not self.IsActive or rawDamage <= 0 then
		return rawDamage
	end

	local energyCost = NativeShieldBoundary.GetDamageEnergyCost(rawDamage)
	if self.CurrentEnergy >= energyCost then
		self.CurrentEnergy -= energyCost
		return 0
	end

	local residual = rawDamage - self.CurrentEnergy * NativeShieldBoundary.GetConfig().DamageEnergyConversion
	self.CurrentEnergy = 0
	self.IsActive = false
	return math.max(0, residual)
end

function ShieldSystem:Step(dt: number)
	if not self.IsActive or dt <= 0 then
		return
	end
	self.IdleAccumulator += dt
	local tick = NativeShieldBoundary.GetNativeTickSeconds()
	local usage = NativeShieldBoundary.GetIdleEnergyUsagePerTick()
	while self.IdleAccumulator >= tick do
		self.IdleAccumulator -= tick
		self.CurrentEnergy = math.max(0, self.CurrentEnergy - usage)
		if self.CurrentEnergy <= 0 then
			self.IsActive = false
			break
		end
	end
end

function ShieldSystem:GetShieldPercent(): number
	return self.MaxEnergy > 0 and self.CurrentEnergy / self.MaxEnergy or 0
end

return ShieldSystem
