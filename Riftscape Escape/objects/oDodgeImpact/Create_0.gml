audio_play_sound_at(aPortalOpen, x, y, 0, 0, 0, 0, 0, 2, global.sfxAudio);
if (oPlayerManager.hasDodgeLife) {
	sprite_index = sPoisDodgeImpact;
}
if (oPlayerManager.hasDodgeFate) {
	with (oEnemy) {
		if (point_distance(x, y, other.x, other.y) <= 256) {
			dragDir = point_direction(x, y, other.x, other.y);
			dragPower = 24;
			dragTimer = 6;
			path_end();
		}
	}
}
damagedList = ds_map_create();

damage = global.playerDamage + sqrt(global.playerReality) * 0.65;
existence = global.playerReality*6;
exisTotal = existence;
/*if (oPlayerManager.hasSwordLife) {
		bulletFire(x, y, point_direction(x, y, mouse_x, mouse_y), global.bullet_speed*2, damage, oSwordLife, oTruePlayer);
		if (oItemManager.hasMetalOrb) {
			bulletFire(x, y, point_direction(x, y, mouse_x, mouse_y)-35, global.bullet_speed*2, damage, oSwordLife, oTruePlayer);
			bulletFire(x, y, point_direction(x, y, mouse_x, mouse_y)+35, global.bullet_speed*2, damage, oSwordLife, oTruePlayer);
		}
		
}
