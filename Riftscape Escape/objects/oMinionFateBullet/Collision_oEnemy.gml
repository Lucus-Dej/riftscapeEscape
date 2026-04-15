instance_create_layer(x, y, "Instances", oBoom);
other.enemey_hp -= damage;
if (other.enemey_hp <= 0) {
	instance_destroy(other);
	global.playerKilled = true;
	}
instance_destroy();
z = 0;
audio_play_sound_at(aBoom, x, y, z, 1, 1, 1, false, 0, global.sfxAudio)