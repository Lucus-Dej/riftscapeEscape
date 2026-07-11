global.musicAudio = 0.2;
global.sfxAudio = 0.5;
global.difficulty = 1;
global.gameSteps = 0;
loadGame()
global.currentTrack = aChimingCrystals;
init = false;
audio_group_load(agMusic);
audio_group_load(agSFX);
if (audio_group_is_loaded(agMusic)) {
	audio_play_sound(global.currentTrack, 1000, true, global.musicAudio);
	control = true;
}
//window_set_fullscreen(true);


sfxLoaded = false;
control = false;
global.enemBulletCount = 0;