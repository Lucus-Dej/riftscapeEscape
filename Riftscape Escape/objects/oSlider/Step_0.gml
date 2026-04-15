if (instance_exists(child)) {
	if (controlsMusic) {
		global.musicAudio = child.sliderVal;
	}
	if (controlsSFX) {
		global.sfxAudio = child.sliderVal;
	}
}