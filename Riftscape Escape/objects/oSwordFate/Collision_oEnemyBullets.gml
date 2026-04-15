if (oPlayerManager.hasSwordTime) {
	var dir = point_direction(x, y, mouse_x, mouse_y);
	parryBullet = bulletFire(x, y, dir, other.speed*2, other.damage/2, global.chosenBullet, oTruePlayer)
	instance_destroy(other);
} else {
boom = instance_create_layer(x, y, "Instances", oBoom);
audio_play_sound_at(aPlayerBoom, x, y, 0, 0, 0, 0, 0, 2, global.sfxAudio);
instance_destroy(other);
instance_destroy(boom);
}
instance_destroy()
if (oPlayerManager.hasSwordReality) {
	oPlayerManager.realitySwordBonus += 1;
}