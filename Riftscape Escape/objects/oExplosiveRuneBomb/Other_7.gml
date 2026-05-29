boom = instance_create_layer(x, y, "Instances", oExplosiveRuneBoom);
boom.image_xscale += 1.5;
boom.image_yscale += 1.5
boom.damage = damage;
audio_play_sound_at(aPlayerBoom, x, y, 0, 1, 1, 1, false, 0, global.sfxAudio)
instance_destroy();
