show_debug_message(spawnID)
if (spawnID == 0) {
	spawnID = owner.RoomID;
}
instance_create_layer(x, y, "Instances", oBoom);
audio_play_sound_at(aBoom, x, y, 0, 1, 1, 1, false, 0, global.sfxAudio)
owner.Manager.roomStart = true;
instance_destroy();