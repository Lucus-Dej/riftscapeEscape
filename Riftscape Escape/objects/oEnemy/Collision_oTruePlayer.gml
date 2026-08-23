if (contactIframe <= 0 && !other.immuneToContactDmg) {
	if (oPlayerManager.iframes <= 0) {
		playerTakeDamage(contactDamage, damageType.contact);
		audio_play_sound_at(aBite, x, y, 1, 1, 1, 1, false, 1, global.sfxAudio);
	}
	
	if (object_index == oTorzling) {
		other.torzPower+=2;
	}
	
	contactIframe = contactIframeCount;
	if (!sub && oPlayerManager.hasDodgeThought && (oPlayerManager.dodgeState = DODGE_PHASE.dodging || oPlayerManager.dodgeState = DODGE_PHASE.blackflashing)) {
		oPlayerManager.thoughtDodgeFireRateBoost += 8;
	}
	if (global.contactDmg > 0) {
		enemyTakeDamage(global.contactDmg, id, , , damageType.contact)
	}
}
if (oItemManager.hasCrackedEgg && oPlayerManager.inOverhealth) {	
	callDOT(id, 0.08, 6, 18, dotType.poison, other);
}

