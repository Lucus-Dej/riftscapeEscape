if (oPlayerManager.hasMinionReality) {
	minionRealitySpeedBonus = -35;
	bulletSpeed = baseBulletSpeed * global.playerReality*0.2 - 0.6;
}
if (oItemManager.hasBloodCharm) {
	var bloodCheck = irandom_range(1, 3) + global.playerTime * 0.2;
	 if (bloodCheck >= 3) {
		var distMax = sprite_width/2;
		var ang = irandom(359);
		
		var spill = instance_create_layer(x, y, "Items", oBloodSpill)
		spill.dmg =  global.playerLife*0.045+minionCrownDmgBonus*0.05;
		var scale = random_range(0.5, 0.75);
		scale = (image_xscale*0.5)*scale;
		spill.image_xscale = scale;
		spill.image_yscale = scale;
		
	 }
}
if (oItemManager.hasLostCrown) {
	minionCrownDmgBonus = 0.2;
	minionCrownSpeedBonus = -25;
}
minionSpeed = 65 + minionRealitySpeedBonus + minionCrownSpeedBonus;
minionSpeed = max(5, minionSpeed);
if (follow != noone) {
	xTo = follow.x;
	yTo = follow.y;
}
x += (xTo - x)/(minionSpeed);
y += (yTo - y)/(minionSpeed);

if (fire && !oPlayerManager.hasMinionThought) {
	var dir =  point_direction(x, y, mouse_x, mouse_y);
	playerBulletFire(x, y, dir, bulletSpeed, global.playerLife*0.045+minionCrownDmgBonus, oMinonBullet, oTruePlayer);
	fire = false;
} else if (oPlayerManager.hasMinionThought) {
	if (instance_exists(oEnemy)) {
		target = instance_nearest(x, y, oEnemy)
		if (bulletDelay > 0)  {
			bulletDelay --;
		}
		if (bulletDelay <= 0) {
			var dir =  point_direction(x, y, target.x, target.y);
			playerBulletFire(x, y, dir, bulletSpeed, global.playerLife*0.045+minionCrownDmgBonus, oMinonBullet, oTruePlayer);
			bulletDelay = bulletCoolDown;
		}
	} else {
		target = noone;
	}
}