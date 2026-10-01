audio_play_sound_at(aPortalOpen, x, y, 0, 0, 0, 0, 0, 2, global.sfxAudio);
//image_angle =  point_direction(oTruePlayer.x, oTruePlayer.y, mouse_x, mouse_y);
image_xscale = sign(mouse_x - oTruePlayer.x);
damagedList = ds_map_create();
if (instance_exists(oSwordFate)) {
	instance_destroy(oSwordFate)
}
var dir = point_direction(x, y, mouse_x, mouse_y);
if (oItemManager.hasFireCharm) {
	var fCount = 6;
	var spacing = 4;
	var startingAng = dir - (spacing*fCount)/2;
	for (var i = 0; i < fCount; i++) {
		var ranSpeed = global.bullet_speed * (random_range(0.5, 1.5));
		fireFireFireCharm(x, y, startingAng, ranSpeed);
		startingAng += spacing;
	}
}
damage = global.playerDamage + oPlayerManager.swordDmgBonus + sqrt(global.playerEssence) * 0.45;
bloodInc = 180/18;
if (oPlayerManager.hasSwordLife) {
	playerBulletFire(x, y, dir, global.bullet_speed*2, damage, oSwordLife, oTruePlayer);
}
timer = 0;
