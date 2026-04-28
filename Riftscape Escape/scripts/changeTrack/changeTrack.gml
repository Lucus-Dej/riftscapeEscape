function changeTrack(_newTrack) {
	audio_sound_gain(global.currentTrack, 0, 3000);
	global.currentTrack = _newTrack;
	audio_play_sound(global.currentTrack, 1000, true, global.musicAudio);
}