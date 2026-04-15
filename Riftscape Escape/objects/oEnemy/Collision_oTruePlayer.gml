if (oPlayerManager.iframes <= 0) {
	global.player_health -= contactDamage;
	oPlayerManager.iframes = 12;
	oPlayerManager.tookDamage = true;
	audio_play_sound_at(aBite, x, y, 1, 1, 1, 1, false, 1, global.sfxAudio);
}