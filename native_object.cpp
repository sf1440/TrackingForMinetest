/*


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

} // end namespace nativeObjectRef



  */