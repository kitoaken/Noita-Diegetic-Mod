table.insert(actions,
{
  id          = "ALWAYS_CAST_ORGANIC",
  name 		= "Organic Core",
  description = "This wand only functions within a Mossy Grove",
  sprite 		= "data/ui_gfx/gun_actions/mana.png",
  sprite_unidentified = "data/ui_gfx/gun_actions/spread_reduce_unidentified.png",
  type 		= ACTION_TYPE_MODIFIER,
  custom_xml_file = "data/entities/misc/custom_cards/mana_reduce.xml",
  action 		= function()
    if not reflecting then

      local entity_id = GetUpdatedEntityID()
      local coord_x, coord_y = EntityGetTransform(entity_id)
      local biome_name = BiomeMapGetName(coord_x, coord_y)

      if biome_name ~= "Mossy Grove" then
        add_projectile("mods/noita-diegetic-mod/files/entities/particles/core_fail_neutralized.xml")
        current_reload_time = 80
			
        for i,v in ipairs( hand ) do
          -- print( "removed " .. v.id .. " from hand" )
          table.insert( discarded, v )
        end
        
        for i,v in ipairs( deck ) do
          -- print( "removed " .. v.id .. " from deck" )
          table.insert( discarded, v )
        end
        
        hand = {}
        deck = {}
        
        if ( force_stop_draws == false ) then
          force_stop_draws = true
          move_discarded_to_deck()
          order_deck()
        end
      end
    end
  end,
}
)