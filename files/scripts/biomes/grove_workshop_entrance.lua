dofile_once("mods/noita-diegetic-mod/files/scripts/lib/utilities.lua")

RegisterSpawnFunction( 0xffffeedd, "init" )

function init( x, y, w, h )
    local pixel_scene = "mods/noita-diegetic-mod/files/biome_impl/grove_entrance.png"
    local pixel_visual = "mods/noita-diegetic-mod/files/biome_impl/grove_workshop_visuaal.png"
    local pixel_bg = "mods/noita-diegetic-mod/files/biome_impl/grove_workshop_backgrounad.png"
	LoadPixelScene( pixel_scene, pixel_visual, x, y, pixel_bg, true )

end