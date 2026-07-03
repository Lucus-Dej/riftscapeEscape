if (contactIframe <= 0 && global.contactDmg > 0 && global.playerContactDmg) {
	contactIframe = contactIframeCount;
	enemyTakeDamage(global.contactDmg, self);
}
if (oItemManager.hasCrackedEgg && oPlayerManager.inOverhealth) {	
	callDOT(id, 0.3, 6, 12, dotType.poison, other);
} 
if (oPlayerManager.iframes <= 0) {
	playerTakeDamage(contactDamage);
	audio_play_sound_at(aBite, x, y, 1, 1, 1, 1, false, 1, global.sfxAudio);
}
	if (contactIframe <= 0 && global.contactDmg > 0 && global.playerContactDmg) {		contactIframe = contactIframeCount;
	enemyTakeDamage(global.contactDmg, self);
}

