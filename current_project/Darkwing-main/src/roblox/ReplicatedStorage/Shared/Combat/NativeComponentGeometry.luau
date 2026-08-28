--!strict
-- Native component geometry operators recovered from the original Void Hunters JAR.
-- This module intentionally exposes only source-resolved operators; it does not
-- invent native slot/type mappings or flatten procedural geometry.

local NativeComponentGeometry = {}

export type Dimensions = {
	a: number, -- native fnb.a
	b: number, -- native fnb.b
}

export type ProceduralSlotSpec = {
	seed: number,
	mode: number,
	variationKind: "MGB" | "INDEX_PLUS" | "CONSTANT",
	variation: number,
	scale: number,
}

local function buildOffsets(dimensions: Dimensions): ({number}, {number})
	local a = dimensions.a
	local b = dimensions.b
	local x = { -b, -a, -b / 2, 0, b / 2, a, b, a, b / 2, 0, -b / 2, -a }
	local y = { 0, -b / 2, -a, -b, -a, -b / 2, 0, b / 2, a, b, a, b / 2 }
	return x, y
end

function NativeComponentGeometry.UcaTransform(
	dimensions: Dimensions,
	originX: number,
	originY: number,
	indices: {number}
): {number}
	local xOffsets, yOffsets = buildOffsets(dimensions)
	local x = originX
	local y = originY
	local out = { x, y }

	for _, index in ipairs(indices) do
		assert(index >= 0 and index <= 11, "native uca index out of range")
		x += xOffsets[index + 1]
		table.insert(out, x)
		y += yOffsets[index + 1]
		table.insert(out, y)
	end
	return out
end

-- Fully resolved native constructor for slot 30.
function NativeComponentGeometry.Slot30(): {number}
	return { 2217, 0, -2217, 2560, -2217, -2560 }
end

-- Resolved uca-based slot constructions from wlb.f(byte), using the native
-- fnb dimensions b=5120 and a=4434. These are emitted as source-derived
-- coordinate arrays; no bounding-box approximation is involved.
function NativeComponentGeometry.GetResolvedSlotPolygon(slot: number): {number}?
	local dimensions: Dimensions = { a = 4434, b = 5120 }
	if slot == 31 then
		local n1 = 2560
		local n2 = 2217
		return { -n1, -n1, n1, -n1, n1 + 2 * n2, 0, n1, n1, -n1, n1 }
	elseif slot == 34 then
		return NativeComponentGeometry.UcaTransform(dimensions, -2560, -2560, { 1, 4, 7, 8, 9, 10, 11, 2, 5 })
	elseif slot == 35 then
		return NativeComponentGeometry.UcaTransform(dimensions, -2560, -2560, { 3, 7, 8, 11, 0 })
	elseif slot == 36 then
		return NativeComponentGeometry.UcaTransform(dimensions, 0, -2560, { 2, 6, 7, 10, 11 })
	elseif slot == 38 then
		return NativeComponentGeometry.UcaTransform(dimensions, -2560, -2560, { 7, 8, 9, 11, 3, 2 })
	elseif slot == 39 then
		return NativeComponentGeometry.UcaTransform(dimensions, -2560, -2560, { 5, 7, 9, 11, 1 })
	elseif slot == 40 then
		return NativeComponentGeometry.UcaTransform(dimensions, -2217, 2560, { 3, 3, 7, 9, 9, 11 })
	elseif slot == 41 then
		return NativeComponentGeometry.UcaTransform(dimensions, -2560, -2217, { 5, 7, 11, 7, 11, 1 })
	end
	return nil
end

-- Exact jba.a call contracts recovered from wlb.f(byte). These describe the
-- native generator invocation without pretending that unresolved mgb/tka/fra
-- semantics are known.
function NativeComponentGeometry.GetProceduralSlotSpec(slot: number): ProceduralSlotSpec?
	if slot == 48 then
		return { seed = 1000, mode = 12, variationKind = "MGB", variation = 47, scale = 2500 }
	elseif slot == 49 then
		return { seed = 1000, mode = 12, variationKind = "MGB", variation = 61, scale = 2500 }
	elseif slot == 50 then
		return { seed = 500, mode = 12, variationKind = "INDEX_PLUS", variation = 45, scale = 1250 }
	elseif slot == 52 then
		return { seed = 500, mode = 12, variationKind = "MGB", variation = -10, scale = 1250 }
	elseif slot == 53 then
		return { seed = 1500, mode = 12, variationKind = "CONSTANT", variation = -127, scale = 3000 }
	elseif slot == 54 then
		return { seed = 1500, mode = 12, variationKind = "CONSTANT", variation = 123, scale = 3000 }
	elseif slot == 55 then
		return { seed = 250, mode = 10, variationKind = "MGB", variation = -108, scale = 625 }
	end
	return nil
end

return NativeComponentGeometry
