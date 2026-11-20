core.register_alias("mapgen_stone", "base:stone")
core.register_alias("mapgen_water_source", "base:water_source")
core.register_alias("mapgen_water_flowing", "base:water_flowing")
core.register_alias("mapgen_singlenode", "base:stone")

core.register_biome({
    name = "base",
    node_top = "base:dirt",
    depth_top = 3,
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