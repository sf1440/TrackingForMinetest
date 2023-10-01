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

} // namespace nativeObjectRef
  */