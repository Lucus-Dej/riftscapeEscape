instance_create_layer(x, y, "Instances", oBoom);
enemyTakeDamage(damage, other);

instance_destroy();
z = 0;
audio_play_sound_at(aBoom, x, y, z, 1, 1, 1, false, 0, global.sfxAudio)