if (oPlayerManager.iframes <= 0) {
instance_create_layer(x, y, "Instances", oBoom);
if (oPlayerManager.dodgeLifeBonus > 0) {
	oPlayerManager.dodgeLifeBonus -= damage;
} else {
	global.player_health -= damage;
}
oPlayerManager.tookDamage = true;
instance_destroy();
z = 0;
audio_play_sound_at(aBoom, x, y, z, 1, 1, 1, false, 0, global.sfxAudio)
}