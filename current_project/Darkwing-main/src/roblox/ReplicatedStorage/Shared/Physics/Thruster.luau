--!strict
-- Thruster: gameplay-facing thruster component.
-- Native force magnitudes are supplied by NativeThrusterBoundary.
-- Generic body force/torque integration remains the replacement-engine responsibility.

local NativeThrusterBoundary = require(script.Parent.NativeThrusterBoundary)

local Thruster = {}
Thruster.__index = Thruster

export type Thruster = {
	Id: string,
	LocalPosition: Vector2,
	Direction: Vector2,
	ThrustMagnitude: number,
	EnergyDrainPerSec: number,
	IsActive: boolean,
	ThrusterType: string,
	NativeKind: NativeThrusterBoundary.ThrusterKind,
	ApplyToBody: (self: Thruster, body: any, throttle: number, dt: number) -> number,
}

local function resolveKind(thrusterType: string): NativeThrusterBoundary.ThrusterKind
	if thrusterType == "Booster" then
		return "Booster"
	elseif thrusterType == "Vector" or thrusterType == "Retro" then
		return "Small"
	end
	return "Main"
end

function Thruster.new(localPosition: Vector2, direction: Vector2?, thrustMagnitude: number?, thrusterType: string?, id: string?)
	local self = setmetatable({}, Thruster)
	self.Id = id or ("th_" .. tostring(math.random(100000, 999999)))
	self.LocalPosition = localPosition or Vector2.zero
	self.Direction = direction and direction.Unit or Vector2.new(0, 1)
	self.ThrusterType = thrusterType or "Main"
	self.NativeKind = resolveKind(self.ThrusterType)
	self.ThrustMagnitude = thrustMagnitude or NativeThrusterBoundary.GetForceScale(self.NativeKind)
	-- No recovered native thruster energy drain is established. Resource consumption
	-- remains a separate gameplay/resource boundary rather than an invented per-second cost.
	self.EnergyDrainPerSec = 0
	self.IsActive = false
	return self
end

function Thruster:ApplyToBody(body: any, throttle: number, dt: number): number
	if not self.IsActive or throttle <= 0 or not body then
		return 0
	end

	local clampedThrottle = math.clamp(throttle, 0, 1)
	local effectiveForce = self.ThrustMagnitude * clampedThrottle
	body:ApplyThrust(self.LocalPosition, self.Direction, effectiveForce)

	-- Native thruster energy cost is not established in the recovered input table.
	return 0
end

return Thruster
