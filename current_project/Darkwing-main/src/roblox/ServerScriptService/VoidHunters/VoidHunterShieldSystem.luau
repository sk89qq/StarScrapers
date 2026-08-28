--[=[
	VoidHunter Shield System

	Canonical server-side shield authority.
	Native inputs cross only through NativeShieldBoundary. Component definitions
	supply explicit shield assembly values; no inferred max energy, regeneration,
	reboot delay, damage modifier, or fallback radius is synthesized here.
]=]

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local Components = require(ReplicatedStorage:WaitForChild("VoidHunterComponents"))
local ShipRegistry = require(ReplicatedStorage.Shared.Ship:WaitForChild("ShipRegistry"))
local NativeShieldBoundary = require(ReplicatedStorage.Shared.Combat:WaitForChild("NativeShieldBoundary"))

local SHIELD_COMPONENT_TYPES: { [string]: boolean } = {
	ShieldGenerator = true,
	ShieldDish = true,
}

local NATIVE = NativeShieldBoundary.GetConfig()
local DEFAULT_GLOW_BRIGHTNESS = 0.9
local DEFAULT_GLOW_RANGE = 80

export type ShieldState = {
	bubble: BasePart,
	ship: Model,
	energy: number,
	maxEnergy: number,
	active: boolean,
	wasActive: boolean,
	lastHitTime: number,
	lastToggleTime: number,
	idleAccumulator: number,
	minEnergyToActivate: number,
	radius: number,
}

local activeShields: { [BasePart]: ShieldState } = setmetatable({}, { __mode = "k" })

local function getComponentDefinition(part: Instance): (string?, any?)
	if not part:IsA("BasePart") then
		return nil, nil
	end
	local typeName = part:GetAttribute("ComponentType")
	if typeof(typeName) ~= "string" or not SHIELD_COMPONENT_TYPES[typeName] then
		return nil, nil
	end
	local definition = Components.Types[typeName]
	if type(definition) ~= "table" then
		return nil, nil
	end
	return typeName, definition
end

local function getShieldComponents(ship: Model): { [BasePart]: any }
	local result: { [BasePart]: any } = {}
	for _, instance in ipairs(ship:GetDescendants()) do
		if instance:IsA("BasePart") then
			local _, definition = getComponentDefinition(instance)
			if definition then
				result[instance] = definition
			end
		end
	end
	return result
end

local function calculateShieldConfiguration(ship: Model): (number, number, number, number)
	local shieldCount = 0
	local totalOutput = 0
	local minActivation = 0

	for _, definition in pairs(getShieldComponents(ship)) do
		local output = definition.ShieldOutput
		if typeof(output) == "number" and output > 0 then
			totalOutput += output
		end
		local activation = definition.MinEnergyToActivate
		if typeof(activation) == "number" and activation >= 0 then
			minActivation = math.max(minActivation, activation)
		end
		shieldCount += 1
	end

	if shieldCount == 0 or totalOutput <= 0 then
		return 0, 0, 0, 0
	end

	-- ShieldOutput is explicit component data. It is not a native fallback or
	-- inferred regeneration/capacity rule. Native radius/arc/consumption semantics
	-- are supplied independently by NativeShieldBoundary.
	return totalOutput, minActivation, NATIVE.DirectionalRadius, shieldCount
end

local function findBubble(shieldPart: BasePart): BasePart?
	local bubble = shieldPart:FindFirstChild("ShieldBubble")
	return bubble and bubble:IsA("BasePart") and bubble or nil
end

local function getBubbleForShip(ship: Model): BasePart?
	for shieldPart in pairs(getShieldComponents(ship)) do
		local bubble = findBubble(shieldPart)
		if bubble then
			return bubble
		end
	end
	return nil
end

local function updateShieldVisual(state: ShieldState)
	local bubble = state.bubble
	if not bubble.Parent then
		return
	end

	local percent = state.maxEnergy > 0 and math.clamp(state.energy / state.maxEnergy, 0, 1) or 0
	local opaqueModule = bubble.Parent:FindFirstChild("GeneratorModule_Opaque")
	local light = bubble:FindFirstChild("BubbleGlow")

	if state.active then
		bubble.Transparency = 0.85 - percent * 0.1
		bubble.Color = Color3.fromRGB(
			math.floor(100 + (1 - percent) * 50),
			math.floor(180 + percent * 40),
			math.floor(220 + percent * 35)
		)
		if light and light:IsA("PointLight") then
			light.Brightness = DEFAULT_GLOW_BRIGHTNESS + percent * 0.5
			light.Range = DEFAULT_GLOW_RANGE + percent * 15
		end
		if opaqueModule and opaqueModule:IsA("BasePart") then
			opaqueModule.Color = Color3.fromRGB(
				math.floor(70 + percent * 30),
				math.floor(160 + percent * 40),
				math.floor(180 + percent * 40)
			)
			opaqueModule.Reflectance = 0.2 + percent * 0.15
		end
	else
		bubble.Transparency = 0.92
		bubble.Color = Color3.fromRGB(100, 200, 255)
		if light and light:IsA("PointLight") then
			light.Brightness = DEFAULT_GLOW_BRIGHTNESS * 0.3 * percent
			light.Range = DEFAULT_GLOW_RANGE * 0.5
		end
		if opaqueModule and opaqueModule:IsA("BasePart") then
			opaqueModule.Color = Color3.fromRGB(70, 160, 160)
			opaqueModule.Reflectance = 0.2
		end
	end

	bubble:SetAttribute("ShieldActive", state.active)
	bubble:SetAttribute("ShieldEnergy", state.energy)
	bubble:SetAttribute("MaxEnergy", state.maxEnergy)
	bubble:SetAttribute("ShieldRadius", state.radius)
	bubble:SetAttribute("ShieldArc", NATIVE.DirectionalArc)
end

local function canToggle(state: ShieldState): boolean
	return os.clock() - state.lastToggleTime >= NATIVE.ToggleCooldown
end

local function activateShield(bubble: BasePart, bypassCooldown: boolean?): boolean
	local state = activeShields[bubble]
	if not state or state.energy < state.minEnergyToActivate then
		return false
	end
	if not bypassCooldown and not canToggle(state) then
		return false
	end
	state.active = true
	state.wasActive = true
	state.lastToggleTime = os.clock()
	updateShieldVisual(state)
	return true
end

local function deactivateShield(bubble: BasePart, bypassCooldown: boolean?): boolean
	local state = activeShields[bubble]
	if not state then
		return false
	end
	if not bypassCooldown and not canToggle(state) then
		return false
	end
	state.active = false
	state.wasActive = false
	state.lastHitTime = os.clock()
	state.lastToggleTime = os.clock()
	updateShieldVisual(state)
	return true
end

local function damageShield(bubble: BasePart, amount: number): boolean
	local state = activeShields[bubble]
	if not state or not state.active or typeof(amount) ~= "number" or amount <= 0 then
		return false
	end

	state.energy = math.max(0, state.energy - NativeShieldBoundary.GetDamageEnergyCost(amount))
	state.lastHitTime = os.clock()

	if state.energy <= 0 then
		state.active = false
		state.wasActive = false
	end
	updateShieldVisual(state)
	return true
end

local function absorbDamageForShip(ship: Model, amount: number): number
	local bubble = getBubbleForShip(ship)
	local state = bubble and activeShields[bubble]
	if not state or not state.active or amount <= 0 then
		return amount
	end

	local energyCost = NativeShieldBoundary.GetDamageEnergyCost(amount)
	if state.energy >= energyCost then
		state.energy -= energyCost
		state.lastHitTime = os.clock()
		updateShieldVisual(state)
		return 0
	end

	local absorbedEnergy = state.energy
	state.energy = 0
	state.active = false
	state.wasActive = false
	state.lastHitTime = os.clock()
	updateShieldVisual(state)
	return math.max(0, amount - absorbedEnergy * NATIVE.DamageEnergyConversion)
end

local function initializeShipShield(ship: Model)
	if not ship:IsA("Model") or not ship:GetAttribute("IsShip") then
		return
	end

	local shieldPart: BasePart? = nil
	for part in pairs(getShieldComponents(ship)) do
		shieldPart = part
		break
	end
	if not shieldPart then
		return
	end

	local bubble = findBubble(shieldPart)
	if not bubble then
		return
	end

	local maxEnergy, minActivation, radius, shieldCount = calculateShieldConfiguration(ship)
	if shieldCount <= 0 then
		return
	end

	local existing = activeShields[bubble]
	if existing and existing.ship == ship then
		return
	end

	local state: ShieldState = {
		bubble = bubble,
		ship = ship,
		energy = maxEnergy,
		maxEnergy = maxEnergy,
		active = false,
		wasActive = false,
		lastHitTime = os.clock(),
		lastToggleTime = -math.huge,
		idleAccumulator = 0,
		minEnergyToActivate = minActivation,
		radius = radius,
	}
	activeShields[bubble] = state
	updateShieldVisual(state)
end

local function scanRegisteredShips()
	for _, ship in pairs(ShipRegistry.GetAll()) do
		initializeShipShield(ship)
	end
end

scanRegisteredShips()

task.spawn(function()
	while true do
		scanRegisteredShips()
		task.wait(1)
	end
end)

RunService.Heartbeat:Connect(function(deltaTime: number)
	for bubble, state in pairs(activeShields) do
		if not bubble.Parent or not state.ship.Parent then
			activeShields[bubble] = nil
			continue
		end

		if state.active then
			state.idleAccumulator += deltaTime
			while state.idleAccumulator >= NATIVE.NativeTickSeconds do
				state.idleAccumulator -= NATIVE.NativeTickSeconds
				state.energy = math.max(0, state.energy - NATIVE.DirectionalIdleEnergyUsage)
				if state.energy <= 0 then
					state.active = false
					state.wasActive = false
					break
				end
			end
		end

		updateShieldVisual(state)
	end
end)

local comms = ReplicatedStorage:FindFirstChild("Communication")
if not comms then
	comms = Instance.new("Folder")
	comms.Name = "Communication"
	comms.Parent = ReplicatedStorage
end

local shieldAction = comms:FindFirstChild("ShieldAction")
if not shieldAction then
	shieldAction = Instance.new("RemoteEvent")
	shieldAction.Name = "ShieldAction"
	shieldAction.Parent = comms
end

local function handleShieldAction(player: Player, action: string, shieldModel: Model?)
	if typeof(action) ~= "string" then
		return
	end
	local ship = ShipRegistry.GetShip(player)
	if not ship or (shieldModel and ship ~= shieldModel) then
		return
	end
	initializeShipShield(ship)
	local bubble = getBubbleForShip(ship)
	if not bubble then
		return
	end
	if action == "activate" then
		activateShield(bubble)
	elseif action == "deactivate" then
		deactivateShield(bubble)
	elseif action == "toggle" then
		local state = activeShields[bubble]
		if state and state.active then
			deactivateShield(bubble)
		else
			activateShield(bubble)
		end
	end
end

(shieldAction :: RemoteEvent).OnServerEvent:Connect(handleShieldAction)

local playerActionEvent = ReplicatedStorage:FindFirstChild("VoidHunterPlayerAction")
if playerActionEvent and playerActionEvent:IsA("RemoteEvent") then
	(playerActionEvent :: RemoteEvent).OnServerEvent:Connect(function(player: Player, action: string, requestedAction: string?)
		if action == "ShieldToggle" then
			handleShieldAction(player, requestedAction or "toggle", nil)
		end
	end)
end

local ShieldSystem = {}
ShieldSystem.damageShield = damageShield
ShieldSystem.absorbDamageForShip = absorbDamageForShip
ShieldSystem.activateShield = activateShield
ShieldSystem.deactivateShield = deactivateShield
ShieldSystem.isShieldActive = function(bubble: BasePart): boolean
	local state = activeShields[bubble]
	return state ~= nil and state.active
end
ShieldSystem.getNativeConfig = function()
	return NativeShieldBoundary.GetConfig()
end

return ShieldSystem
