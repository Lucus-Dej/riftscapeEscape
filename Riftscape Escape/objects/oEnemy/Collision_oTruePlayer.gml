if (contactIframe == 0) {
	global.player_health -= contactDamage;
	contactIframe = contactIframeCount;
	audio_play_sound_at(aBite, x, y, 1, 1, 1, 1, false, 1);
}