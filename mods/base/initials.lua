-- Ejemplo 1: Atmósfera densa ámbar/ocre (recomendada para contrastar con tu agua turquesa)
core.register_on_joinplayer(function(player)
	player:set_sky({
		base_color = "#7a4928",
		type = "regular",
		sky_color = {
			day_sky     = "#8c522b",
			day_horizon = "#b8743b",
			dawn_sky    = "#5e2b1d",
			dawn_horizon= "#9e472a",
			night_sky   = "#140b0a",
			night_horizon = "#2b1612",
			indoors     = "#1a1412",
			fog_sun_tint  = "#ff9944",
			fog_moon_tint = "#668899",
			fog_tint_type = "custom"
		},
		clouds = true
	})

	player:set_clouds({
		color   = "#c98b55d0",
		ambient = "#59351e",
		density = 0.55,
		height  = 110,
		thickness = 24,
		speed   = {x = 3, z = -1}
	})
end)

core.override_item("", {
    --wield_image = "wieldhand.png",
    wield_scale = {x = 1, y = 1, z = 2.5},
    range = 4.0, -- Optional: default reach distance in nodes
    tool_capabilities = {
        full_punch_interval = 0.9,
        max_drop_level = 0,
        groupcaps = {
            crumbly = {times = {[2] = 3.00, [3] = 0.70}, uses = 0, maxlevel = 1},
            snappy = {times = {[3] = 0.40}, uses = 0, maxlevel = 1},
            oddly_breakable_by_hand = {times = {[1] = 3.50, [2] = 2.00, [3] = 0.70}, uses = 0}
        },
        damage_groups = {fleshy = 1},
    }
})