if (oPlayerManager.hasSwordTime) {
	bulletFire(x, y, point_direction(x, y, mouse_x, mouse_y), other.speed*2, other.damage*0.65, global.chosenBullet, oTruePlayer);
	instance_destroy(other);
	
} else {
boom = instance_create_layer(x, y, "Instances", oBoom);
audio_play_sound_at(aPlayerBoom, x, y, 0, 0, 0, 0, 0, 2, global.sfxAudio);
instance_destroy(other);
instance_destroy(boom);
}
if (oPlayerManager.hasSwordReality) {
	oPlayerManager.realitySwordBonus += 1;
}