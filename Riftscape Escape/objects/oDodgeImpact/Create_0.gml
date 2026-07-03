audio_play_sound_at(aPortalOpen, x, y, 0, 0, 0, 0, 0, 2, global.sfxAudio);

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
