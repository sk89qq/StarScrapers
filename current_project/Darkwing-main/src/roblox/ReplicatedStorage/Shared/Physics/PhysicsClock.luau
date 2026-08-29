--!strict
--[[
	Single architecture-level physics clock authority.

	Consumers should use this module instead of embedding a fixed simulation
	frequency. FIXED_DT is the recovered native timestep exposed by
	PhysicsConfig; this module also provides accumulator stepping so variable
	frame delivery cannot silently change simulation cadence.
]]

local PhysicsConfig = require(script.Parent.PhysicsConfig)

local PhysicsClock = {}

PhysicsClock.HZ = PhysicsConfig.SIMULATION_HZ
PhysicsClock.DT = PhysicsConfig.FIXED_DT
PhysicsClock.MAX_FRAME_TIME = PhysicsConfig.MAX_FRAME_TIME
PhysicsClock.SUB_STEPS = PhysicsConfig.SUB_STEPS

function PhysicsClock.accumulate(accumulator: number, frameTime: number): (number, number)
	local clamped = math.min(math.max(frameTime, 0), PhysicsClock.MAX_FRAME_TIME)
	local total = accumulator + clamped
	local steps = math.floor(total / PhysicsClock.DT)
	return total - steps * PhysicsClock.DT, steps
end

function PhysicsClock.stepCount(frameTime: number): number
	local _, steps = PhysicsClock.accumulate(0, frameTime)
	return steps
end

return PhysicsClock
