if (contactIframe <= 0 && global.contactDmg > 0 && global.playerContactDmg) {
	contactIframe = contactIframeCount;
	if (!sub && oPlayerManager.hasDodgeThought && (oPlayerManager.dodgeState = DODGE_PHASE.dodging || oPlayerManager.dodgeState = DODGE_PHASE.blackflashing)) {
		oPlayerManager.thoughtDodgeFireRateBoost += 8;
	}
	if (oItemManager.hasCrackedEgg && oPlayerManager.inOverhealth) {	
		callDOT(id, 0.2, 6, 18, dotType.poison, other);
	} else {
		enemyTakeDamage(global.contactDmg, self);
	}
	
}
 
if (oPlayerManager.iframes <= 0) {
	playerTakeDamage(contactDamage, damageType.contact);
	audio_play_sound_at(aBite, x, y, 1, 1, 1, 1, false, 1, global.sfxAudio);
}
