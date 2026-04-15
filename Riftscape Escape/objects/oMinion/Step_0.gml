event_inherited()
if (oPlayerManager.hasMinionReality) {
	minionSpeed = 30;
} else {
	minionSpeed = 65;
}

if (follow != noone) {
	xTo = follow.x;
	yTo = follow.y;
}
x += (xTo - x)/(minionSpeed);
y += (yTo - y)/(minionSpeed);

if (fire && !oPlayerManager.hasMinionThought) {
	var dir =  point_direction(x, y, mouse_x, mouse_y);
	bulletFire(x, y, dir, 4.5, global.playerLife*0.045, oMinonBullet, oTruePlayer);
	if (oPlayerManager.hasMinionFate) {
		if (oItemManager.hasMetalOrb) {
			bulletFire(x, y, dir+35, 4.5, global.playerLife*0.02, oMinonBullet, oTruePlayer);
			bulletFire(x, y, dir-35, 4.5, global.playerLife*0.02, oMinonBullet, oTruePlayer);
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
			bulletFireAt(x, y, target, 4.5, global.playerDamage/4, oMinonBullet, oTruePlayer);
			if (oPlayerManager.hasMinionFate) {
				var dir = point_direction(x, y, target.x, target.y);
				if (oItemManager.hasMetalOrb) {
					bulletFire(x, y, dir+35, 4.5, global.playerDamage*0.1, oMinonBullet, oTruePlayer);
					bulletFire(x, y, dir-35, 4.5, global.playerDamage*0.1, oMinonBullet, oTruePlayer);
				}
			}
			bulletDelay = bulletCoolDown;
		}
	} else {
		target = noone;
	}
}