-- constants (color format is ARGB)
dofile_once("data/scripts/lib/utilities.lua")

local w = 70
local h = 48

-- TODO: Reference the same workshop XML for ALL biomes, then replace the lua file reference through code as needed for each workshop
BiomeMapSetSize(w, h)
BiomeMapLoadImage(0, 0, "data/biome_impl/biome_map.png")
BiomeMapSetPixel(2, 37, 0xff346f89)

-- Debug to place a workshop at spawn
BiomeMapSetPixel(34, 14, 0xff346f89)