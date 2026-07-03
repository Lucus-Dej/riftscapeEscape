if (oPlayerManager.iframes <= 0) {
	other.flash = 1;
instance_create_layer(x, y, "Instances", oBoom);
if (oPlayerManager.dodgeLifeBonus > 0) {
	if (dotDamage > 0 && instance_exists(dotTarget)) {
		callDOT(dotTarget, dotDamage, dotTicks, dotDelay, type, source);
	}
	oPlayerManager.dodgeLifeBonus -= damage;
} else {
	if (dotDamage > 0 && instance_exists(dotTarget)) {
		callDOT(dotTarget, dotDamage, dotTicks, dotDelay, type, source);
	}
	playerTakeDamage(damage);
	//global.player_health -= damage;
}
oPlayerManager.tookDamage = true;
instance_destroy();
z = 0;
audio_play_sound_at(aBoom, x, y, z, 1, 1, 1, false, 0, global.sfxAudio)
}
