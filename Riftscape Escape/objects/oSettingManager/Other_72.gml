if (audio_group_is_loaded(agMusic)) {
	audio_play_sound(global.currentTrack, 1000, true);
	control = true;
}
if (audio_group_is_loaded(agSFX)) {
	sfxLoaded = true;
}
