if (oItemManager.hasCrackedEgg) {
		if (oPlayerManager.iframes <= 0 && !oPlayerManager.inOverhealth) {
		global.player_health -= contactDamage;
		oPlayerManager.tookDamage = true;
		audio_play_sound_at(aBite, x, y, 1, 1, 1, 1, false, 1, global.sfxAudio);
	}
	if (contactIframe <= 0 && global.contactDmg > 0 && global.playerContactDmg) {
		contactIframe = contactIframeCount;
		enemyTakeDamage(global.contactDmg, self);
	}
} else {
	if (oPlayerManager.iframes <= 0) {
		global.player_health -= contactDamage;
		oTruePlayer.flash = 1;
		oPlayerManager.tookDamage = true;
		audio_play_sound_at(aBite, x, y, 1, 1, 1, 1, false, 1, global.sfxAudio);
	}
	if (contactIframe <= 0 && global.contactDmg > 0 && global.playerContactDmg) {
		contactIframe = contactIframeCount;
		enemyTakeDamage(global.contactDmg, self);
	}
}
