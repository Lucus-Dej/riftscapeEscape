audio_listener_position(x, y, 0);
audio_play_sound_at(aPortalOpen, x, y, 0, 1, 1, 1, false, 0, global.sfxAudio);
boom = instance_create_layer(x, y, "Instances", oPortal);
boom.existance = 5;
idleTime = 30;