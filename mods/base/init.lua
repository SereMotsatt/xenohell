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

uploadfile("nodes")
uploadfile("mapgen")

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