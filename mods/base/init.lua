base = {}
base.version = "26.11.0"

-- mis helpers
core_get_translator = core.get_translator --Lo mas innecesario que veras hoy :C
ref_cgt = core_get_translator('base')

function base.reg1nodo(named, ref)
	local modname = core.get_current_modname()
	if ref.description ~= nil then
		ref.description = ref_cgt(ref.description)
	end
	core.register_node(modname .. ":" .. named, ref)
end

function base.reg1objfab(named, ref)
	local modname = core.get_current_modname()
	if ref.description ~= nil then
		ref.description = ref_cgt(ref.description)
	end
	core.register_craftitem(modname .. ":" .. named, ref)
end

-- -------------
function uploadfile(filelua)
	dofile(core.get_modpath(core.get_current_modname()).."/"..filelua..".lua")
end

-- ############

minetest.register_on_joinplayer(function(player)
	player:set_lighting({
		saturation = 1.1, -- Colores hiper-saturados y antinaturales
		shadows = {
			intensity = 0.75, -- Sombras mucho más marcadas para contraste dramático
			tint = {r = 120, g = 43, b = 0.0} -- Intacto
		},
		volumetric_light = {
			strength = 0.12 -- Niebla de luz densa (12x más fuerte) para sensación de atmósfera pesada/tóxica
		},
		exposure = {
			exposure_correction = 0.4, -- Ligera subexposición base para que resalten los brillos
			luminance_min = -6.0, -- Permite ver detalles en oscuridad profunda (casi visión nocturna)
			luminance_max = -1.2, -- Quema un poco las luces altas para efecto de radiación/estrella cercana
			speed_dark_bright = 40.0, -- Adaptación ocular más lenta y orgánica
			speed_bright_dark = 10.0
		},
		bloom = {
			intensity = 0.035, -- Resplandor evidente en emisores de luz y reflejos
			strength_factor = 1.0, -- Fuerza de expansión del brillo
			radius = 1.4 -- Halo amplio y difuso, típico de atmósferas densas
		},
	})
	minetest.chat_send_player(player:get_player_name(), "Welcome to Xenohell, (WORK IN PROGRESS).")
	minetest.chat_send_player(player:get_player_name(), "Xenohell v"..base.version)
end)

-- START

uploadfile("initials")
uploadfile("natural_nodes")
uploadfile("craft_nodes")
uploadfile("craft")
uploadfile("mapgen")

