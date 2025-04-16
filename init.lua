dofile_once( "data/scripts/lib/utilities.lua" )

ModMagicNumbersFileAdd("mods/noita-diegetic-mod/files/magic_numbers.xml")

local nxml = dofile_once( "mods/noita-diegetic-mod/files/lib/nxml.lua" )

local new = nxml.parse_file("mods/noita-diegetic-mod/files/biomes/diegetic_biomes.xml")
for tree in nxml.edit_file("data/biome/_biomes_all.xml") do
    for child in new:each_child() do tree:add_child(child) end
end

