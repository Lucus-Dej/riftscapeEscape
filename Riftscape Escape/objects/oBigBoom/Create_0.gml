image_speed = .2;
purpose = 0;
damage = global.playerDamage*.75;
boomDamageList = ds_map_create();
z = 0;
	audio_listener_position(x, y, z);
	audio_play_sound_at(aBoom, x, y, z, 1, 1, 1, false, 0)
	