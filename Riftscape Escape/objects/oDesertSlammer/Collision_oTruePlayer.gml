if (state == ENEM_STATE.CHARGE && iFrames <= 0 && oPlayerManager.iframes <= 0) {
	audio_play_sound_at(aBoom, x, y, 1, 1, 1, 1, false, 1);
	oPlayerManager.tookDamage = true;
	if (oPlayerManager.dodgeLifeBonus > 0) {
		oPlayerManager.dodgeLifeBonus -= damage*6.5;
	} else {
		global.player_health -= damage*5;
	}
	iFrames = impactDelay;
} else if (iFrames <= 0 && oPlayerManager.iframes <= 0) {
	audio_play_sound_at(aBite, x, y, 1, 1, 1, 1, false, 1);
	oPlayerManager.tookDamage = true;
	if (oPlayerManager.dodgeLifeBonus > 0) {
		oPlayerManager.dodgeLifeBonus -= damage;
	} else {
		global.player_health -= damage;
	}
	iFrames = impactDelay;
}