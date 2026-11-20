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
    y_max = 31000,
    y_min = 1,
    decoration = "base:xenograss",
})


-- Schematics
local modpath = core.get_modpath(core.get_current_modname())

local modpath = core.get_modpath(core.get_current_modname())

core.register_decoration({
	deco_type = "schematic",
	place_on = {"base:external_dirt"},
	sidelen = 8,
	noise_params = {
		offset = 0.002,
		scale = 0.08,
		spread = {x = 100, y = 100, z = 100},
		seed = 9918,
		octaves = 2,
		persist = 0.6
	},
	schematic = modpath .. "/schematics/stipe_large.mts",
	rotation = "random",
	flags = "place_center_x, place_center_z",
	y_max = 31000,
	y_min = 1,
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