if (!other.parried && oPlayerManager.hasSwordTime && other.canParry) {
	audio_play_sound_at(aPlayerBoom, x, y, 0, 0, 0, 0, 0, 2, global.sfxAudio);
	instance_create_layer(x, y, "Instances", oBoom)
	parryBullet = instance_create_layer(x, y, "Instances", global.chosenBullet)
	parryBullet.parried = true;
	parryBullet.direction = point_direction(x, y, mouse_x, mouse_y);
	parryBullet.speed = other.speed*2;
	parryBullet.damage = global.playerDamage + global.playerDamage;
	instance_destroy(other);
}