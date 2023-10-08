/*
#include "native_object.h"
#include "player.h"

namespace nativeObjectRef
{
void n_set_breath(ServerActiveObject *sao, u16 breath);
u16 n_get_breath(ServerActiveObject *sao);
}



namespace nativeObjectRef
{
void n_set_breath(ServerActiveObject *sao, u16 breath)
{
	PlayerSAO *playersao = dynamic_cast<PlayerSAO *>(sao);
	if (playersao) {
		playersao->setBreath(breath);
	}
}

u16 n_get_breath(ServerActiveObject *sao)
{
	PlayerSAO *playersao = dynamic_cast<PlayerSAO *>(sao);
	if (playersao) {
		return playersao->getBreath();
	}
	return 0; // Or a suitable default value if playersao is nullptr
}
}

namespace nativeObjectRef
{

void n_set_attribute(ServerActiveObject *sao, const std::string &attribute,
		const std::string &value)
{
	PlayerSAO *playersao = dynamic_cast<PlayerSAO *>(sao);
	if (playersao) {
		if (value.empty()) {
			playersao->getMeta().removeString(attribute);
		} else {
			playersao->getMeta().setString(attribute, value);
		}
	}
}

std::string n_get_attribute(ServerActiveObject *sao, const std::string &attribute)
{
	PlayerSAO *playersao = dynamic_cast<PlayerSAO *>(sao);
	if (playersao) {
		std::string value;
		if (playersao->getMeta().getStringToRef(attribute, value)) {
			return value;
		}
	}
	return "";
}

PlayerMetaRef *n_get_meta(ServerActiveObject *sao)
{
	PlayerSAO *playersao = dynamic_cast<PlayerSAO *>(sao);
	if (playersao) {
		return &playersao->getMeta();
	}
	return nullptr;
}

namespace nativeObjectRef
{

void n_set_fov(ServerActiveObject *sao, float degrees, bool is_multiplier,
		float transition_time)
{
	RemotePlayer *player = dynamic_cast<RemotePlayer *>(sao);
	if (player) {
		player->setFov({degrees, is_multiplier, transition_time});
		// Assuming you have access to the server instance
		// getServer()->SendPlayerFov(player->getPeerId());  // Adjust as needed
	}
}

PlayerFovSpec n_get_fov(ServerActiveObject *sao)
{
	RemotePlayer *player = dynamic_cast<RemotePlayer *>(sao);
	if (player) {
		return player->getFov();
	}
	return {}; // Return a default or error value as appropriate for your system
}

namespace nativeObjectRef
{

std::string n_get_player_name(ServerActiveObject *sao)
{
	RemotePlayer *player = dynamic_cast<RemotePlayer *>(sao);
	if (player) {
		return player->getName();
	}
	return "";
}

}

namespace nativeObjectRef {

// Declaration
v3f n_get_look_dir(ServerActiveObject *sao);

// Definition
v3f n_get_look_dir(ServerActiveObject *sao) {
    PlayerSAO *playersao = dynamic_cast<PlayerSAO *>(sao);
    if (!playersao) {
	// Return a zero vector or a suitable default if playersao is nullptr
	return v3f(0, 0, 0);
    }

    float pitch = playersao->getRadLookPitchDep();
    float yaw = playersao->getRadYawDep();
    return v3f(std::cos(pitch) * std::cos(yaw), std::sin(pitch), std::cos(pitch) *
std::sin(yaw));
}

namespace nativeObjectRef {

    float n_get_look_pitch(ServerActiveObject *sao) {
	PlayerSAO *playersao = dynamic_cast<PlayerSAO *>(sao);
	if (playersao) {
	    return playersao->getRadLookPitchDep();
	}
	return 0.0; // Or a suitable default value.
    }

    float n_get_look_yaw(ServerActiveObject *sao) {
	PlayerSAO *playersao = dynamic_cast<PlayerSAO *>(sao);
	if (playersao) {
	    return playersao->getRadYawDep();
	}
	return 0.0; // Or a suitable default value.
    }

    float n_get_look_vertical(ServerActiveObject *sao) {
	PlayerSAO *playersao = dynamic_cast<PlayerSAO *>(sao);
	if (playersao) {
	    return playersao->getRadLookPitch();
	}
	return 0.0; // Or a suitable default value.
    }

    float n_get_look_horizontal(ServerActiveObject *sao) {
	PlayerSAO *playersao = dynamic_cast<PlayerSAO *>(sao);
	if (playersao) {
	    return playersao->getRadRotation().Y;
	}
	return 0.0; // Or a suitable default value.
    }
}

-- Native n_get_look_pitch
minetest.register_chatcommand("native_object_get_look_pitch", {
    description = "Test Native Get Look Pitch",
    func = function(name, param)
	minetest.log("native_object_get_look_pitch is running!")
	local player = minetest.get_player_by_name(name)
	if not player then
	    minetest.log("Player not found")
	    return
	end

	local look_pitch = player:native_get_look_pitch()
	minetest.log("Native Look Pitch: " .. look_pitch)
    end,
})

-- Native n_get_look_yaw
minetest.register_chatcommand("native_object_get_look_yaw", {
    description = "Test Native Get Look Yaw",
    func = function(name, param)
	minetest.log("native_object_get_look_yaw is running!")
	local player = minetest.get_player_by_name(name)
	if not player then
	    minetest.log("Player not found")
	    return
	end

	local look_yaw = player:native_get_look_yaw()
	minetest.log("Native Look Yaw: " .. look_yaw)
    end,
})

-- Native n_get_look_vertical
minetest.register_chatcommand("native_object_get_look_vertical", {
    description = "Test Native Get Look Vertical",
    func = function(name, param)
	minetest.log("native_object_get_look_vertical is running!")
	local player = minetest.get_player_by_name(name)
	if not player then
	    minetest.log("Player not found")
	    return
	end

	local look_vertical = player:native_get_look_vertical()
	minetest.log("Native Look Vertical: " .. look_vertical)
    end,
})

-- Native n_get_look_horizontal
minetest.register_chatcommand("native_object_get_look_horizontal", {
    description = "Test Native Get Look Horizontal",
    func = function(name, param)
	minetest.log("native_object_get_look_horizontal is running!")
	local player = minetest.get_player_by_name(name)
	if not player then
	    minetest.log("Player not found")
	    return
	end

	local look_horizontal = player:native_get_look_horizontal()
	minetest.log("Native Look Horizontal: " .. look_horizontal)
    end,
})

namespace nativeObjectRef {

void n_set_look_vertical(ServerActiveObject *sao, float radians) {
    PlayerSAO *playersao = dynamic_cast<PlayerSAO *>(sao);
    if (playersao) {
	playersao->setLookPitchAndSend(radians * core::RADTODEG);
    }
}

void n_set_look_horizontal(ServerActiveObject *sao, float radians) {
    PlayerSAO *playersao = dynamic_cast<PlayerSAO *>(sao);
    if (playersao) {
	playersao->setPlayerYawAndSend(radians * core::RADTODEG);
    }
}

// DEPRECATED
void n_set_look_pitch(ServerActiveObject *sao, float radians) {
    PlayerSAO *playersao = dynamic_cast<PlayerSAO *>(sao);
    if (playersao) {
	playersao->setLookPitchAndSend(radians * core::RADTODEG);
    }
}

// DEPRECATED
void n_set_look_yaw(ServerActiveObject *sao, float radians) {
    PlayerSAO *playersao = dynamic_cast<PlayerSAO *>(sao);
    if (playersao) {
	playersao->setPlayerYawAndSend(radians * core::RADTODEG);
    }
}


namespace nativeObjectRef {

    // Conversion: Lua table -> SkyboxParams
    SkyboxParams table_to_skybox_params(lua_State *L, int index) {
	SkyboxParams params;
	// Assume table is at the top of the stack.

	// Extract bgcolor from the table
	lua_getfield(L, index, "bgcolor");
	params.bgcolor = read_ARGB8(L, -1); // Convert Lua color to C++ color.
	lua_pop(L, 1);

	// Similar conversions for other members of SkyboxParams...
	// ...

	return params;
    }

    // Conversion: SkyColor -> Lua table
    void push_sky_color_to_lua(lua_State *L, const SkyColor& color) {
	lua_newtable(L);
	// Assuming SkyColor has members like day_sky, day_horizon, etc.
	push_ARGB8(L, color.day_sky);
	lua_setfield(L, -2, "day_sky");
	// ... similar pushes for other members ...
    }

    void n_set_sky(ServerActiveObject* sao, lua_State *L, int index) {
	RemotePlayer* player = dynamic_cast<RemotePlayer*>(sao);
	if (!player) {
	    lua_pushstring(L, "Invalid player object.");
	    lua_error(L);
	    return;
	}

	SkyboxParams params = table_to_skybox_params(L, index);
	player->setSky(params);
    }

    void n_get_sky(ServerActiveObject* sao, lua_State *L) {
	RemotePlayer* player = dynamic_cast<RemotePlayer*>(sao);
	if (!player) {
	    lua_pushstring(L, "Invalid player object.");
	    lua_error(L);
	    return;
	}

	SkyboxParams params = player->getSkyParams();
	// Convert params to Lua table and push to Lua stack.
	// This function assumes you have the conversion functions ready.
	skybox_params_to_table(L, params);
    }

    void n_get_sky_color(ServerActiveObject* sao, lua_State *L) {
	RemotePlayer* player = dynamic_cast<RemotePlayer*>(sao);
	if (!player) {
	    lua_pushstring(L, "Invalid player object.");
	    lua_error(L);
	    return;
	}

	SkyColor color = player->getSkyParams().sky_color;
	// Convert color to Lua table and push to Lua stack.
	push_sky_color_to_lua(L, color);
    }
}

namespace nativeObjectRef {

// Native version of set_sun
void n_set_sun(RemotePlayer *player, const SunParams &params) {
    if (player) {
	player->getServer()->setSun(player, params);
    }
}

// Native version of get_sun
SunParams n_get_sun(RemotePlayer *player) {
    if (player) {
	return player->getSunParams();
    }
    // Return default or null SunParams if player is nullptr. Adjust as necessary.
    return SunParams();
}

// Native version of set_moon
void n_set_moon(RemotePlayer *player, const MoonParams &params) {
    if (player) {
	player->getServer()->setMoon(player, params);
    }
}

// Native version of get_moon
MoonParams n_get_moon(RemotePlayer *player) {
    if (player) {
	return player->getMoonParams();
    }
    // Return default or null MoonParams if player is nullptr. Adjust as necessary.
    return MoonParams();
}





  */