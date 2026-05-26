if (oPlayerManager.hasMinionReality) {
	minionRealitySpeedBonus = -20;
}
if (oItemManager.hasLostCrown) {
	minionCrownDmgBonus = 0.08;
	minionCrownSpeedBonus = -25;
}
minionSpeed = 65 + minionRealitySpeedBonus + minionCrownSpeedBonus;
minionSpeed = max(5, minionSpeed);
existance--;
if (existance <= 0) {
	instance_destroy();
}


if (follow != noone) {
	xTo = follow.x;
	yTo = follow.y;
}
x += (xTo - x)/(minionSpeed);
y += (yTo - y)/(minionSpeed);
var dmg = oPlayerManager.essenceMinionCount*0.025*global.playerEssence+minionCrownDmgBonus;
if (fire && !oPlayerManager.hasMinionThought) {
	var dir =  point_direction(x, y, mouse_x, mouse_y);
	bulletFire(x, y, dir, 4.5, dmg, oMinonBullet, oTruePlayer);
	if (oPlayerManager.hasMinionFate) {
		if (oItemManager.hasMetalOrb) {
			bulletFire(x, y, dir+35, 4.5, dmg/4, oMinonBullet, oTruePlayer);
			bulletFire(x, y, dir-35, 4.5, dmg/4, oMinonBullet, oTruePlayer);
		}
	}
	fire = false;
} else if (oPlayerManager.hasMinionThought) {
	if (instance_exists(oEnemy)) {
		target = instance_nearest(x, y, oEnemy)
		if (bulletDelay > 0)  {
			bulletDelay --;
		}
		if (bulletDelay <= 0) {
			bulletFireAt(x, y, target, 4.5, dmg, oMinonBullet, oTruePlayer);
			if (oPlayerManager.hasMinionFate) {
				var dir = point_direction(x, y, target.x, target.y);
				if (oItemManager.hasMetalOrb) {
					bulletFire(x, y, dir+35, 4.5, dmg/4, oMinonBullet, oTruePlayer);
					bulletFire(x, y, dir-35, 4.5, dmg/4, oMinonBullet, oTruePlayer);
				}
			}
			bulletDelay = bulletCoolDown;
		}
	} else {
		target = noone;
	}
}