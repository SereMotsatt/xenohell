base = {}
base.version = "0.26.11.19"

-- mis helpers
core_get_translator = core.get_translator --Lo mas innecesario que veras hoy :C
ref_cgt = core_get_translator('base')

function base.reg1nodo(named, ref)
	if ref.description ~= nil then
		ref.description = ref_cgt(ref.description)
	end
	core.register_node(named, ref)
end

function base.reg1objfab(named, ref)
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

uploadfile("initials")
uploadfile("nodes")
uploadfile("mapgen")

