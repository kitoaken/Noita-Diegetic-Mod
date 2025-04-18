CHEST_LEVEL = 3
dofile_once("data/scripts/director_helpers.lua")
dofile_once("data/scripts/biome_scripts.lua")
dofile_once("data/scripts/lib/utilities.lua")
dofile_once("data/scripts/perks/perk.lua")

RegisterSpawnFunction( 0xffffeedd, "init" )
RegisterSpawnFunction( 0xff31d0b4, "spawn_essence" )

function spawn_small_enemies( x, y ) end
function spawn_big_enemies( x, y ) end
function spawn_items( x, y ) end
function spawn_props( x, y ) end
function spawn_props2( x, y ) end
function spawn_props3( x, y ) end
function spawn_lamp( x, y ) end
function load_pixel_scene( x, y ) end
function load_pixel_scene2( x, y ) end
function spawn_unique_enemy( x, y ) end
function spawn_unique_enemy2( x, y ) end
function spawn_unique_enemy3( x, y ) end
function spawn_ghostlamp( x, y ) end
function spawn_candles( x, y ) end
function spawn_potions( x, y ) end
function spawn_wands( x, y ) end

function init( x, y, w, h )
    local pixel_scene = "mods/noita-diegetic-mod/files/biome_impl/opas_workshop.png"
    local pixel_visual = "mods/noita-diegetic-mod/files/biome_impl/opas_workshop_visual.png"
    local pixel_bg = "mods/noita-diegetic-mod/files/biome_impl/opas_workshop_background.png"
	LoadPixelScene( pixel_scene, pixel_visual, x, y, pixel_bg, true )
end

function spawn_orb(x, y)
end

function spawn_essence(x, y)
	EntityLoad( "data/entities/items/pickup/musicstone.xml", x - 24, y )
	EntityLoad( "mods/noita-diegetic-mod/files/entities/items/books/cringe_book.xml", x + 24, y - 16 )
end