audio_play_sound_at(aPortalOpen, x, y, 0, 0, 0, 0, 0, 2, global.sfxAudio);
//image_angle =  point_direction(oTruePlayer.x, oTruePlayer.y, mouse_x, mouse_y);
image_xscale = sign(mouse_x - oTruePlayer.x);
damagedList = ds_map_create();
if (instance_exists(oSwordFate)) {
	instance_destroy(oSwordFate)
}
damage = global.playerDamage + oPlayerManager.swordDmgBonus;
if (oPlayerManager.hasSwordLife) {
		bulletFire(x, y, point_direction(x, y, mouse_x, mouse_y), global.bullet_speed*2, damage, oSwordLife, oTruePlayer);
		if (oItemManager.hasMetalOrb) {
			bulletFire(x, y, point_direction(x, y, mouse_x, mouse_y)-35, global.bullet_speed*2, damage, oSwordLife, oTruePlayer);
			bulletFire(x, y, point_direction(x, y, mouse_x, mouse_y)+35, global.bullet_speed*2, damage, oSwordLife, oTruePlayer);
		}
		
}

