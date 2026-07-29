
if (oPlayerManager.invisTimer > 180) {
	oPlayerManager.invisTimer += 30;
} else {
	oPlayerManager.invisTimer += 90;
}
instance_destroy();
audio_play_sound(aPortalOpen, 3, false, global.sfxAudio);