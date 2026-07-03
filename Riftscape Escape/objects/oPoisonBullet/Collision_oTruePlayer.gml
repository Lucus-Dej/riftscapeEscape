if (oPlayerManager.iframes <= 0) {
instance_create_layer(x, y, "Instances", oBoom);
if (oPlayerManager.dodgeLifeBonus > 0) {
	oPlayerManager.dodgeLifeBonus -= damage;
	dotTarget = other;
	callDOT(dotTarget, dotDamage, dotTicks, dotDelay, type, source)
} else {
	dotTarget = other;
	callDOT(dotTarget, dotDamage, dotTicks, dotDelay, type, source)
	playerTakeDamage(damage);
}
oPlayerManager.tookDamage = true;
instance_destroy();
z = 0;
audio_play_sound_at(aBoom, x, y, z, 1, 1, 1, false, 0, global.sfxAudio)
}