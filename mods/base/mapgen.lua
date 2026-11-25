core.register_alias("mapgen_stone", "base:stone")
core.register_alias("mapgen_water_source", "base:water_source")
core.register_alias("mapgen_water_flowing", "base:water_flowing")
core.register_alias("mapgen_singlenode", "base:stone")

core.register_biome({
    name = "base",
    node_top = "base:external_dirt",
    depth_top = 1,
    node_filler = "base:dirt",
    depth_filler = 3,
    y_min = 1,
    y_max = 31000,
    heat_point = 50,
    humidity_point = 50,
})

core.register_biome({
    name = "hardlands",
    node_top = "base:sand",
    depth_top = 2,
    node_filler = "base:sandstone",
    depth_filler = 3,
    y_min = 1,
    y_max = 31000,
    heat_point = 70,
    humidity_point = 37,
})

core.register_biome({
    name = "basedown",
    node_top = "base:mud",
    depth_top = 2,
    y_min = -250,
    y_max = 1,
    heat_point = 50,
    humidity_point = 50,
})

core.register_decoration({
    deco_type = "simple",
    place_on = {"base:external_dirt"},
    sidelen = 16,
    noise_params = {
        offset = -0.02,
        scale = 0.38,
        spread = {x = 100, y = 100, z = 100},
        seed = 1525,
        octaves = 3,
        persist = 0.6
    },
    biomes = {"base"},
    y_max = 31000,
    y_min = 1,
    decoration = "base:grass",
})

core.register_decoration({
    deco_type = "simple",
    place_on = {"base:mud"},
    sidelen = 16,
    noise_params = {
        offset = -0.02,
        scale = 0.78,
        spread = {x = 100, y = 100, z = 100},
        seed = 1525,
        octaves = 3,
        persist = 0.6
    },
    biomes = {"base"},
    y_max = 31000,
    y_min = 1,
    decoration = "base:grass",
})

core.register_decoration({
    deco_type = "simple",
    place_on = {"base:sand"},
    sidelen = 16,
    noise_params = {
        offset = -0.02,
        scale = 0.07,
        spread = {x = 100, y = 100, z = 100},
        seed = 4140,
        octaves = 3,
        persist = 0.6
    },
    biomes = {"hardlands"},
    y_max = 31000,
    y_min = 1,
    decoration = "base:dry_grass",
})

-- Schematics
local modpath = core.get_modpath(core.get_current_modname())

core.register_decoration({
	deco_type = "schematic",
	place_on = {"base:external_dirt"},
	sidelen = 16,
	noise_params = {
		offset = 0.002,
		scale = 0.08,
		spread = {x = 100, y = 100, z = 100},
		seed = 9918,
		octaves = 2,
		persist = 0.6
	},
	schematic = modpath .. "/schematics/carbonwood_tree.mts",
	rotation = "random",
    spawn_by = {"base:mud"},
    num_spawn_by = 1,
	flags = "place_center_x, place_center_z",
    place_offset_y = 1,
    biomes = {"base"},
	y_max = 31000,
	y_min = 2,
})

core.register_decoration({
	deco_type = "schematic",
	place_on = {"base:mud"},
	sidelen = 16,
	noise_params = {
		offset = 0.002,
		scale = 0.08,
		spread = {x = 100, y = 100, z = 100},
		seed = 9918,
		octaves = 2,
		persist = 0.6
	},
	schematic = modpath .. "/schematics/carbonwood_tree.mts",
	rotation = "random",
    spawn_by = {"base:external_dirt"},
    num_spawn_by = 1,
	flags = "place_center_x, place_center_z",
    place_offset_y = 1,
    biomes = {"base"},
	y_max = 31000,
	y_min = 2,
})

-- ores

core.register_ore({
	ore_type       = "blob",
	ore            = "base:mud",
	wherein        = {"base:external_dirt"},
	clust_scarcity = 8 * 8 * 8, -- Qué tan separados aparecen los parches (menor = más frecuentes)
	clust_size     = 5,            -- Radio aproximado del parche en nodos
	y_max          = 31000,
	y_min          = 1,
    biomes         = {"base"},
	noise_threshold = 0.0,         -- Umbral de corte del ruido (sube a 0.2 o 0.4 para parches más aislados)
	noise_params   = {
		offset = 0.5,
		scale = 1,
		spread = {x = 100, y = 100, z = 100},
		seed = 4421,
		octaves = 3,
		persist = 0.70
	},
})

-- Forzar mapgen carpathian en áreas nuevas
--minetest.set_mapgen_setting("mg_name", "carpathian", true)

-- Flags de Carpathian: activar caverns y desactivar floatlands/ridges extremos
--minetest.set_mapgen_setting("mgcarpathian_spflags", "caverns,nofloatlands", true)

-- Nivel del agua estable
minetest.set_mapgen_setting("water_level", "1", true)

-- Terreno base muy suave y extenso
minetest.set_mapgen_setting_noiseparams("mgcarpathian_np_base", {
    offset = -2,
    scale = 8,
    spread = {x = 150, y = 150, z = 150},
    seed = 90412,
    octaves = 4,
    persistence = 0.4,
    lacunarity = 2.0,
}, true)

-- Elevaciones principales de Carpathian: bajas y espaciadas para mantener la planicie
minetest.set_mapgen_setting_noiseparams("mgcarpathian_np_height1", {
    offset = -0.8,
    scale = 0.55,
    spread = {x = 14, y = 14, z = 150},
    seed = 55109,
    octaves = 4,
    persistence = 0.45,
    lacunarity = 2.0,
}, true)

minetest.set_mapgen_setting_noiseparams("mgcarpathian_np_height2", {
    offset = -0.8,
    scale = 0.35,
    spread = {x = 500, y = 500, z = 500},
    seed = 31887,
    octaves = 3,
    persistence = 0.45,
    lacunarity = 2.1,
}, true)

-- Picos / crestas suaves y puntuales sin saturar el horizonte
minetest.set_mapgen_setting_noiseparams("mgcarpathian_np_hill_spikey", {
    offset = -0.65,
    scale = 0.2,
    spread = {x = 25, y = 25, z = 300},
    seed = 77421,
    octaves = 4,
    persistence = 0.2,
    lacunarity = 4.15,
}, true)

minetest.set_mapgen_setting_noiseparams("mgcarpathian_np_high_ridge", {
    offset = -0.85,
    scale = 0.5,
    spread = {x = 600, y = 600, z = 600},
    seed = 64205,
    octaves = 3,
    persistence = 0.45,
    lacunarity = 2.0,
}, true)