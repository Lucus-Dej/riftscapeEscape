audio_play_sound_at(aPortalOpen, x, y, 0, 0, 0, 0, 0, 2);
//image_angle =  point_direction(oTruePlayer.x, oTruePlayer.y, mouse_x, mouse_y);
image_xscale = sign(mouse_x - oTruePlayer.x);
damagedList = ds_map_create();
if (instance_exists(oSwordFate)) {
	instance_destroy(oSwordFate)
}
if (oPlayerManager.hasSwordLife) {
		var swordProj = instance_create_layer(x, y, "Instances", oSwordLife);
		swordProj.speed = global.bullet_speed*2;
		swordProj.direction = point_direction(x, y, mouse_x, mouse_y);
		swordProj.image_angle = swordProj.direction - 90;
		swordProj.damage = global.playerDamage;
}

