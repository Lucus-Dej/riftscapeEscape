if (instance_exists(child)) {
	if (controlsMusic) {
		global.musicAudio = child.sliderVal;
	}
	if (controlsSFX) {
		global.sfxAudio = child.sliderVal;
	}
}
if (!display) {
	instance_destroy(child)
	instance_destroy(id);
}