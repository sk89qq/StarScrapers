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

	-- Exact uca.a(int, byte, int[], int) tables.
	local x = {
		-b,
		-a,
		-b / 2,
		0,
		b / 2,
		a,
		b,
		a,
		b / 2,
		0,
		-b / 2,
		-a,
	}

	local y = {
		0,
		-b / 2,
		-a,
		-b,
		-a,
		-b / 2,
		0,
		b / 2,
		a,
		b,
		a,
		b / 2,
	}

	return x, y
end

-- Exact native uca.a transform for its required byte selector (9).
-- Input indices are the native path/index sequence. The returned array is
-- alternating x/y coordinates and begins with the supplied origin.
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

-- Slot 30 is a generated-expression in the native table, but its constructor
-- inputs are completely resolved. Keep it as an explicit source-derived shape
-- rather than routing it through the procedural generator.
function NativeComponentGeometry.Slot30(): {number}
	return { 2217, 0, -2217, 2560, -2217, -2560 }
end

-- Exact jba.a call contracts recovered from wlb.f(byte). These describe the
-- native generator invocation without pretending that unresolved mgb/tka/fra
-- semantics are known. `variation` is either a constant or the second operand
-- of mgb.a(index, operand); INDEX_PLUS means iload_0 + variation.
function NativeComponentGeometry.GetProceduralSlotSpec(
	slot: number
): ProceduralSlotSpec?
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
