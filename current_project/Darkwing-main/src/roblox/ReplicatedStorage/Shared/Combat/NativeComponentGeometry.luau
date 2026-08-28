--!strict
-- Native component geometry operators recovered from the original Void Hunters JAR.
-- This module intentionally exposes only source-resolved operators; it does not
-- invent native slot/type mappings or flatten procedural geometry.

local NativeComponentGeometry = {}

export type Dimensions = {
	a: number, -- native fnb.a
	b: number, -- native fnb.b
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
-- alternating integer x/y coordinates and begins with the supplied origin.
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

return NativeComponentGeometry
