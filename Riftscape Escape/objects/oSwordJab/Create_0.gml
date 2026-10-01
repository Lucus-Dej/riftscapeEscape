audio_play_sound_at(aPortalOpen, x, y, 0, 0, 0, 0, 0, 2, global.sfxAudio);
//image_angle =  point_direction(oTruePlayer.x, oTruePlayer.y, mouse_x, mouse_y);

var dir = oPlayer.image_angle;
image_angle = dir - 90;
if (oItemManager.hasFireCharm) {
	var fCount = 3;
	var spacing = 4;
	var startingAng = dir - (spacing*fCount)/2;
	for (var i = 0; i < fCount; i++) {
		var ranSpeed = global.bullet_speed * (random_range(0.5, 1.5));
		fireFireFireCharm(x, y, startingAng, ranSpeed);
		startingAng += spacing;
	}
}
if (oItemManager.hasIceCharm) {
	var snow = instance_create_layer(x, y, "Instances", oSnowStorm);
	snow.speed = global.bullet_speed*0.4;
	snow.direction = dir;
}

damagedList = ds_map_create();
currentJabRadius = 0;
maxJabRadius = 48;
flipped = false;
increaseRate = 4;

damage = (global.playerDamage + oPlayerManager.swordDmgBonus + sqrt(global.playerEssence) * 0.45)*0.1;
