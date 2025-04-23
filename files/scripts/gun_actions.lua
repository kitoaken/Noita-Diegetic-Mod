dofile_once("mods/noita-diegetic-mod/files/scripts/lib/utilities.lua")

-----------------------------------------------------
-- Actions to append to vanilla spells
-----------------------------------------------------

-- Check to see if the player is in the Mossy Grove biome
-- String check is a bit slower but this won't be called constantly

function check_grove()
  if not reflecting then

    local entity_id = GetUpdatedEntityID()
    local coord_x, coord_y = EntityGetTransform(entity_id)
    local biome_name = BiomeMapGetName(coord_x, coord_y)

    if biome_name ~= "Mossy Grove" then return true
    end
  end
end

function fail_spell()
  add_projectile("mods/noita-diegetic-mod/files/entities/particles/core_fail_neutralized.xml")
  current_reload_time = 40
end

-- Mostly same code as Wand Refresh
function fail_alwayscast()

  fail_spell()

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

-----------------------------------------------------
-- Any new spells added by the mod (shouldn't be many)
-----------------------------------------------------


diegetic_newspells = {
  {
    id          = "ORGANIC_CORE",
    name 		= "Organic Core",
    description = "This wand is bound to the Mossy Grove.",
    sprite 		= "data/ui_gfx/gun_actions/air_bullet_unidentified.png",
    sprite_unidentified = "data/ui_gfx/gun_actions/spread_reduce_unidentified.png",
    type 		= ACTION_TYPE_MODIFIER,
    custom_xml_file = "mods/noita-diegetic-mod/files/entities/misc/custom_cards/organic_core.xml",
    action 		= function()
      if check_grove() then
        fail_alwayscast()
      end
    end,
  }
}

-- Add vanilla spell IDs here to gen grove equivalents
variant_spell_ids = {
  "LIGHT_BULLET",
  "CHAINSAW",
  "MANA_REDUCE",
  "BURST_2"
}

-----------------------------------------------------
--Appending to main Actions
-----------------------------------------------------

variant_spells_table = {}

-- Two nested for loops feels like I'm missing something important in LUA,
-- but a quick google says this is the right way. Berate me if this is cringe

for i=1, #actions do
  for x=1, #variant_spell_ids do
    local variant_spell = deepcopy(actions[i])
    if variant_spell.id == variant_spell_ids[x] then

      variant_spell.id = variant_spell.id .. "_GROVE"
      variant_spell.name = GameTextGet(variant_spell.name) .. " (Grove)"
      variant_spell.description = GameTextGet(variant_spell.description) .. ". This spell is bound to the Mossy Grove."
      --variant_spell.name = GameTextGet(variant_spell.name) .. "Test"

      local vanilla_function = variant_spell.action
      variant_spell.action = function()
        if check_grove() then
          fail_spell()
        else
          vanilla_function()
        end
      end

      table.insert(variant_spells_table, variant_spell)
    end
  end
end

-- Could technically combine these
for i=1, #diegetic_newspells do
  table.insert(actions, diegetic_newspells[i])
end

for i=1, #variant_spells_table do
  table.insert(actions, variant_spells_table[i])
end