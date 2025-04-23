dofile_once("mods/noita-diegetic-mod/files/scripts/lib/utilities.lua")

RegisterSpawnFunction( 0xffffeedd, "init" )
RegisterSpawnFunction( 0xff31d0b4, "spawn_visualizer" )
RegisterSpawnFunction( 0xff31c2d0, "spawn_spells" )
RegisterSpawnFunction( 0xff318cd0, "spawn_target_dummy" )
RegisterSpawnFunction( 0xff3147d0, "spawn_pedestal_items" )

function init( x, y, w, h )
    local pixel_scene = "mods/noita-diegetic-mod/files/biome_impl/grove_workshop.png"
    local pixel_visual = "mods/noita-diegetic-mod/files/biome_impl/grove_workshop_visual.png"
    local pixel_bg = "mods/noita-diegetic-mod/files/biome_impl/grove_workshop_background.png"
	LoadPixelScene( pixel_scene, pixel_visual, x, y, pixel_bg, true )

end

function spawn_visualizer(x, y)
	EntityLoad("data/entities/buildings/workshop_spell_visualizer.xml", x - 60, y - 31)
end

function spawn_spells(x, y)

    local spell_1 = CreateItemActionEntity("MANA_REDUCE_GROVE", x - 48, y)
    local spell_2 = CreateItemActionEntity("CHAINSAW_GROVE", x - 24, y)
    local spell_3 = CreateItemActionEntity("LIGHT_BULLET_GROVE", x, y)
    local spell_4 = CreateItemActionEntity("LIGHT_BULLET_GROVE", x + 24, y)
    local spell_5 = CreateItemActionEntity("LIGHT_BULLET_GROVE", x + 48, y)

end

function spawn_target_dummy(x, y)
    if ModIsEnabled("grahamsdummy") then
        EntityLoad("mods/grahamsdummy/files/dummy.xml", x, y-5)
    else
        EntityLoad("data/entities/props/temple_statue_01.xml", x, y)
    end
end

function spawn_pedestal_items(x, y)
    EntityLoad("mods/noita-diegetic-mod/files/entities/items/books/workshop_book_01.xml", x, y)
    EntityLoad("mods/noita-diegetic-mod/files/entities/items/wands/test_wand.xml", x, y-20)
    --ModSettingSet("workshop_01_purchase", "051210")
end