--Lamia's Biome patch

local function PatchGamesInitlua() --patching vanilla's init.lua, we are doing it here since this file loads before any mods
	local file = "data/scripts/init.lua"
	local patch = "mods/noita-diegetic-mod/files/scripts/lib/biome_modifiers/init_biome_modifiers_patcher.lua"
	local file_appends = ModLuaFileGetAppends(file)
	local strip_pattern = "[^/]*.lua$"

	for _, append in ipairs(file_appends) do
		if append:match(strip_pattern) == "init_biome_modifiers_patcher.lua" then
			return
		end
	end

	ModLuaFileAppend(file, patch)
end

function ModSettingsUpdate(init_scope)
	if init_scope == 0 or init_scope == 1 then PatchGamesInitlua() end
end