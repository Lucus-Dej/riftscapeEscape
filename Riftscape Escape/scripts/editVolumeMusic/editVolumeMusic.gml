function editVolumeMusic(){
	audio_group_set_gain(agMusic, global.musicAudio);
}
function editVolumeSFX() {
	audio_group_set_gain(agSFX, global.sfxAudio);
	audio_play_sound(aBoom, 1000, false, global.sfxAudio);
}