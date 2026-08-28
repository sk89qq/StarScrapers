--!strict
--[=[
	NativeGrappleBoundary

	Single implementation-facing boundary for grapple inputs recovered from the
	original native registry. Values remain in raw native units. Generic rope
	constraint/physics behavior belongs to Roblox/the replacement physics layer.
]=]

local NativeGameplayConfig = require(script.Parent.NativeGameplayConfig)

local NativeGrappleBoundary = {}

export type Config = {
	GRAPPLING_HOOK_AIMSPEED: number,
	GRAPPLING_HOOK_AIMARC: number,
	GRAPPLING_HOOK_COOLDOWN: number,
	GRAPPLING_HOOK_FIRE_FORCE: number,
	GRAPPLING_HOOK_SPRING_CONSTANT: number,
	GRAPPLING_HOOK_MAX_EXTENSION8_FORCE: number,
	GRAPPLING_HOOK_MAX_LENGTH: number,
	GRAPPLING_HOOK_MIN_LENGTH: number,
	GRAPPLING_HOOK_ROPE_CHANGE_RATE: number,
	GRAPPLING_HOOK_ROPE_BREAK_LENGTH: number,
	GRAPPLE_DEBRIS: number,
	PHYSICS_COLLISION_GRAPPLING_HOOK_FORCE_MULTIPLIER: number,
	GRAPPLING_HOOKS_DAMAGEABLE_BY_SOURCE_PLAYER: number,
	NativeTickSeconds: number,
}

local function read(name: string): number
	local value = NativeGameplayConfig[name]
	assert(typeof(value) == "number", `Missing canonical native grapple input: {name}`)
	return value
end

local CONFIG: Config = {
	GRAPPLING_HOOK_AIMSPEED = read("GRAPPLING_HOOK_AIMSPEED"),
	GRAPPLING_HOOK_AIMARC = read("GRAPPLING_HOOK_AIMARC"),
	GRAPPLING_HOOK_COOLDOWN = read("GRAPPLING_HOOK_COOLDOWN"),
	GRAPPLING_HOOK_FIRE_FORCE = read("GRAPPLING_HOOK_FIRE_FORCE"),
	GRAPPLING_HOOK_SPRING_CONSTANT = read("GRAPPLING_HOOK_SPRING_CONSTANT"),
	GRAPPLING_HOOK_MAX_EXTENSION8_FORCE = read("GRAPPLING_HOOK_MAX_EXTENSION8_FORCE"),
	GRAPPLING_HOOK_MAX_LENGTH = read("GRAPPLING_HOOK_MAX_LENGTH"),
	GRAPPLING_HOOK_MIN_LENGTH = read("GRAPPLING_HOOK_MIN_LENGTH"),
	GRAPPLING_HOOK_ROPE_CHANGE_RATE = read("GRAPPLING_HOOK_ROPE_CHANGE_RATE"),
	GRAPPLING_HOOK_ROPE_BREAK_LENGTH = read("GRAPPLING_HOOK_ROPE_BREAK_LENGTH"),
	GRAPPLE_DEBRIS = read("GRAPPLE_DEBRIS"),
	PHYSICS_COLLISION_GRAPPLING_HOOK_FORCE_MULTIPLIER = read("PHYSICS_COLLISION_GRAPPLING_HOOK_FORCE_MULTIPLIER"),
	GRAPPLING_HOOKS_DAMAGEABLE_BY_SOURCE_PLAYER = read("GRAPPLING_HOOKS_DAMAGEABLE_BY_SOURCE_PLAYER"),
	NativeTickSeconds = 0.02,
}

function NativeGrappleBoundary.GetConfig(): Config
	return table.clone(CONFIG)
end

return NativeGrappleBoundary
