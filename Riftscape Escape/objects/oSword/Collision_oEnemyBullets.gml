if (oPlayerManager.hasSwordTime) {
	parryBullet = instance_create_layer(x, y, "Instances", global.chosenBullet)
	parryBullet.direction = point_direction(x, y, mouse_x, mouse_y);
	parryBullet.speed = other.speed*2;
	parryBullet.damage = other.damage/2;
	instance_destroy(other);
} else {
boom = instance_create_layer(x, y, "Instances", oBoom);
audio_play_sound_at(aPlayerBoom, x, y, 0, 0, 0, 0, 0, 2);
instance_destroy(other);
instance_destroy(boom);
}
if (oPlayerManager.hasSwordReality) {
	oPlayerManager.realitySwordBonus += 1;
}