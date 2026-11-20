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
        seed = 4321,
        octaves = 3,
        persist = 0.6
    },
    y_max = 31000,
    y_min = 1,
    decoration = "base:xenograss",
    
    -- Combina densidad (3) + desplazamiento aleatorio horizontal (8) + variación de tamaño (16) = 27
    param2 = 27,
})