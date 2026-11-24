
base.reg1nodo("base:stone", {
	description = "Stone",
	tiles = {"base_stone.png"},
	groups = {cracky=3, stone=1},
	drop = 'base:cobble',
	--sounds = default.node_sound_stone_defaults(),
})

base.reg1nodo("base:sandstone", {
	description = "Sandstone",
	tiles = {"base_sandstone.png"},
	groups = {cracky=3, stone=1},
	drop = 'base:sandstone',
	--sounds = default.node_sound_stone_defaults(),
})

base.reg1nodo("base:cobble", {
	description = "Cobble",
	tiles = {"base_cobble.png"},
	groups = {cracky=3, stone=1},
	drop = 'base:cobble',
	--sounds = default.node_sound_stone_defaults(),
})

base.reg1nodo("base:dirt", {
	description = "Dirt",
	tiles = {"base_dirt.png"},
	groups = {crumbly=3, soil=1},
	drop = 'base:dirt',
	--sounds = default.node_sound_dirt_defaults(),
})

base.reg1nodo("base:external_dirt", {
	description = "External Dirt",
	tiles = {"base_external_dirt.png"},
	groups = {crumbly=3, soil=1},
	drop = 'base:dirt',
	--sounds = default.node_sound_dirt_defaults(),
})

base.reg1nodo("base:sand", {
	description = "Sand",
	tiles = {"base_sand.png"},
	groups = {crumbly=3, soil=1},
	drop = 'base:sand',
	--sounds = default.node_sound_dirt_defaults(),
})

base.reg1nodo("base:mud", {
	description = "Mud",
	tiles = {"base_mud.png"},
	groups = {crumbly=3, soil=1},
	drop = 'base:mud',
	--sounds = default.node_sound_dirt_defaults(),
})

base.reg1nodo("base:water_source", {
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
    waving = 3,
	liquidtype = "source",
	liquid_alternative_flowing = "base:water_flowing",
	liquid_alternative_source = "base:water_source",
	liquid_viscosity = 1,
	post_effect_color = {a=103, r=30, g=90, b=60},
	groups = {water=3, liquid=3, puts_out_fire=1},
})

base.reg1nodo("base:water_flowing", {
	description = "Flowing Water",
	drawtype = "flowingliquid",
	tiles = {"base_water.png"},
    special_tiles = {
		{name="base_water.png", backface_culling=false},
		{name="base_water.png", backface_culling=true},
	},
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
    waving = 3,
	liquidtype = "flowing",
	liquid_alternative_flowing = "base:water_flowing",
	liquid_alternative_source = "base:water_source",
	liquid_viscosity = 1,
	post_effect_color = {a=103, r=30, g=90, b=60},
	groups = {water=3, liquid=3, puts_out_fire=1, not_in_creative_inventory=1},
})

base.reg1nodo("base:xenograss", {
    description = "Xenograss",
    drawtype = "plantlike",
    tiles = {"base_xenograss.png"},
    waving = 1,
    inventory_image = "base_xenograss.png",
    wield_image = "base_xenograss.png",
    paramtype = "light",
    sunlight_propagates = true,
    walkable = false,
    buildable_to = true,
    selection_box = {
        type = "fixed",
        fixed = {-0.35, -0.5, -0.35, 0.35, -0.5+0.8, 0.35},
    },
    groups = {snappy=3, flammable=2, flora=1, attached_node=1},
    --sounds = default.node_sound_leaves_defaults(),
})

base.reg1nodo("base:carbonwood_log" , {
    description = "Carbonwood log",
    tiles = {
        "base_carbonwood_top.png", "base_carbonwood_top.png", "base_carbonwood.png",
        "base_carbonwood.png", "base_carbonwood.png", "base_carbonwood.png",
    },
    paramtype2 = "facedir",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.5, -0.25, 0.25, 0.5, 0.25},
		},
	},
    groups = {choppy=2, oddly_breakable_by_hand=1, flammable=3},
    --sounds = default.node_sound_wood_defaults(),
})

base.reg1nodo("base:carbonwood_log_with_fungus" , {
    description = "Carbonwood log with fungus",
    tiles = {
        "base_carbonwood_top.png", "base_carbonwood_top.png", "base_carbonwood_fungus.png",
        "base_carbonwood_fungus.png", "base_carbonwood_fungus.png", "base_carbonwood_fungus.png",
    },
    paramtype2 = "facedir",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.5, -0.25, 0.25, 0.5, 0.25},
		},
	},
    groups = {choppy=2, oddly_breakable_by_hand=1, flammable=3},
    --sounds = default.node_sound_wood_defaults(),
})

base.reg1nodo("base:external_fungus", {
	description = "External Fungus",
    drawtype = "plantlike",
	tiles = {"base_external_fungus.png"},
    inventory_image = "base_external_fungus.png",
    wield_image = "base_external_fungus.png",
    paramtype = "light",
    sunlight_propagates = true,
    walkable = false,
    selection_box = {
        type = "fixed",
        fixed = {-0.25, -0.5, -0.25, 0.25, 0.0, 0.25},
    },
    visual_scale = 0.8,
	groups = {snappy=3, flammable=2, flora=1, attached_node=1},
	drop = 'base:external_fungus',
	--sounds = default.node_sound_dirt_defaults(),
})