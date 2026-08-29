--!strict
--[[
	PhysicsConfig: Native-authoritative configuration for the Void Hunters 2D
	physics port.

	Recovered native values are kept in their native representation. The port
	does not retain deprecated Roblox-side physics constants or guessed unit
	mappings. Box2D is responsible for executing the recovered operators.
]]

local PhysicsConfig = {
	-- Recovered native source defaults
	NATIVE_THRUSTER_FORCE = 192,
	NATIVE_THRUSTER_BOOSTER_FORCE = 1024,
	NATIVE_THRUSTER_SMALL_FORCE = 16,
	NATIVE_VELOCITY_SUSTAIN = 508,
	NATIVE_VELOCITY_SUSTAIN_MAX = 512,
	NATIVE_ANGULAR_VELOCITY_SUSTAIN = 234,
	NATIVE_ANGULAR_FORCE_DOWNSHIFT = 4,
	NATIVE_ANGULAR_VELOCITY_SUSTAIN_MAX = 256,
	NATIVE_TORQUE_DOWNSHIFT = 4,
	NATIVE_MOMENT_OF_INERTIA_PREDIVIDE_DOWNSHIFT = 12,
	NATIVE_MOMENT_OF_INERTIA_PERPOINT_CALC_DOWNSHIFT = 8,
	NATIVE_PHYSICS_COLLISION_FORCE_MULTIPLIER = 4096,
	NATIVE_PHYSICS_COLLISION_GRAPPLING_HOOK_FORCE_MULTIPLIER = 4096,
	NATIVE_PHYSICS_COLLISION_PHANTOM_FORCE_MULTIPLIER = 2048,
	NATIVE_DEBRIS_DETACHMENT_FORCE_MULTIPLIER = 256,
	NATIVE_COMPONENT_BREAKING_EXPLOSION_FORCE_MULTIPLIER = 32768,

	-- Recovered native fixed-point/operator constants
	NATIVE_FORCE_POINT_SHIFT = 4,
	NATIVE_TORQUE_POINT_SHIFT = 4,
	NATIVE_ANGULAR_VELOCITY_DENOMINATOR_SHIFT = 12,

	-- Authoritative recovered simulation clock
	SIMULATION_HZ = 30,
	FIXED_DT = 1 / 30,
}

return PhysicsConfig
