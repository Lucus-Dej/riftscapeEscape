if (oPlayerManager.hasMinionReality) {
	minionRealitySpeedBonus = -35;
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
	if (oPlayerManager.hasMinionFate) {
		playerBulletFire(x, y, dir, 5.5, global.playerLife*0.045+minionCrownDmgBonus, oMinonBullet, oTruePlayer);
	} else {
		bulletFire(x, y, dir, 5.5, global.playerLife*0.045+minionCrownDmgBonus, oMinonBullet, oTruePlayer);
	}
	fire = false;
} else if (oPlayerManager.hasMinionThought) {
	if (instance_exists(oEnemy)) {
		target = instance_nearest(x, y, oEnemy)
		if (bulletDelay > 0)  {
			bulletDelay --;
		}
		if (bulletDelay <= 0) {
			var dir =  point_direction(x, y, target.x, target.y);
			if (oPlayerManager.hasMinionFate) {
				playerBulletFire(x, y, dir, 5.5, global.playerLife*0.045+minionCrownDmgBonus, oMinonBullet, oTruePlayer);
			} else {
				bulletFire(x, y, dir, 5.5, global.playerLife*0.045+minionCrownDmgBonus, oMinonBullet, oTruePlayer);
			}
			bulletDelay = bulletCoolDown;
		}
	} else {
		target = noone;
	}
}