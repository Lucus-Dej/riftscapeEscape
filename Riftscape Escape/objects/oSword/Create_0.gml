audio_play_sound_at(aPortalOpen, x, y, 0, 0, 0, 0, 0, 2, global.sfxAudio);
//image_angle =  point_direction(oTruePlayer.x, oTruePlayer.y, mouse_x, mouse_y);
image_xscale = sign(mouse_x - oTruePlayer.x);
damagedList = ds_map_create();
if (instance_exists(oSwordFate)) {
	instance_destroy(oSwordFate)
}
var dir = point_direction(x, y, mouse_x, mouse_y);
damage = global.playerDamage + oPlayerManager.swordDmgBonus + sqrt(global.playerEssence) * 0.45;
if (oPlayerManager.hasSwordLife) {
	playerBulletFire(x, y, dir, global.bullet_speed*2, damage, oSwordLife, oTruePlayer);
}

