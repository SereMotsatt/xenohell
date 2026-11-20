base = {}
base.version = "0.26.11.19"

-- mis helpers
core_get_translator = core.get_translator --Lo mas innecesario que veras hoy :C
ref_cgt = core_get_translator('base')

function reg1nodo(named, ref)
	if ref.description ~= nil then
		ref.description = ref_cgt(ref.description)
	end
	core.register_node(named, ref)
end

function reg1objfab(named, ref)
	if ref.description ~= nil then
		ref.description = ref_cgt(ref.description)
	end
	core.register_craftitem(named, ref)
end

-- -------------
function uploadfile(filelua)
	dofile(core.get_modpath(core.get_current_modname()).."/"..filelua..".lua")
end

-- ############

minetest.register_on_joinplayer(function(player)
	player:set_lighting({
		saturation=1.2,
		shadows={intensity=0.5, tint={r=0,g=0,b=0.3}},
		volumetric_light={strength=0.2},
		exposure={exposure_correction=1.0,luminance_min=-5.0,luminance_max=-2.0,speed_dark_bright=100.0,speed_bright_dark=20.0},
		bloom={intensity=0.16, strength_factor=0.2}
	})
	minetest.chat_send_player(player:get_player_name(), "Welcome to Xenohell, (WORK IN PROGRESS).")
	minetest.chat_send_player(player:get_player_name(), "Xenohell v"..base.version)
end)

-- START

uploadfile("mapgen")


-- Registro de Nodos

reg1nodo("base:stone", {
	description = "Stone",
	tiles = {"base_stone.png"},
	groups = {cracky=3, stone=1},
	drop = 'base:cobble',
	--sounds = default.node_sound_stone_defaults(),
})

reg1nodo("base:dirt", {
	description = "Dirt",
	tiles = {"base_dirt.png"},
	groups = {crumbly=3, soil=1},
	drop = 'base:dirt',
	--sounds = default.node_sound_dirt_defaults(),
})

reg1nodo("base:mud", {
	description = "Mud",
	tiles = {"base_mud.png"},
	groups = {crumbly=3, soil=1},
	drop = 'base:mud',
	--sounds = default.node_sound_dirt_defaults(),
})

reg1nodo("base:water_source", {
	description = "Water Source",
	drawtype = "liquid",
	tiles = {"base_water.png"},
	--special_tiles = {
	--	{
	--		name = "base_water_source_animated.png",
	--		backface_culling = false,
	--	},
	--},
	use_texture_alpha = "blend",
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	liquidtype = "source",
	liquid_alternative_flowing = "base:water_flowing",
	liquid_alternative_source = "base:water_source",
	liquid_viscosity = 1,
	post_effect_color = {a=103, r=30, g=90, b=60},
	groups = {water=3, liquid=3, puts_out_fire=1},
})

reg1nodo("base:water_flowing", {
	description = "Flowing Water",
	drawtype = "flowingliquid",
	tiles = {"base_water.png"},
	--special_tiles = {
	--	{
	--		name = "base_water_flowing_animated.png",
	--		backface_culling = false,
	--		animation = {type="vertical_frames", aspect_w=16, aspect_h=16, length=0.8},
	--	},
	--	{
	--		name = "base_water_flowing_animated.png",
	--		backface_culling = true,
	--		animation = {type="vertical_frames", aspect_w=16, aspect_h=16, length=0.8},
	--	},
	--},
	use_texture_alpha = "blend",
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	liquidtype = "flowing",
	liquid_alternative_flowing = "base:water_flowing",
	liquid_alternative_source = "base:water_source",
	liquid_viscosity = 1,
	post_effect_color = {a=103, r=30, g=90, b=60},
	groups = {water=3, liquid=3, puts_out_fire=1, not_in_creative_inventory=1},
})