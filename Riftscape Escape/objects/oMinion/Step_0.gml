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
	bulletFire(x, y, dir, 4.5, global.playerDamage/4, oMinonBullet, id);
	if (oPlayerManager.hasMinionFate) {
		if (oItemManager.hasMetalOrb) {
			bulletFire(x, y, dir+35, 4.5, global.playerDamage*0.1, oMinonBullet, id);
			bulletFire(x, y, dir-35, 4.5, global.playerDamage*0.1, oMinonBullet, id);
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
			bulletFireAt(x, y, target, 4.5, global.playerDamage/4, oMinonBullet, id);
			if (oPlayerManager.hasMinionFate) {
				var dir = point_direction(x, y, target.x, target.y);
				if (oItemManager.hasMetalOrb) {
					bulletFire(x, y, dir+35, 4.5, global.playerDamage*0.1, oMinonBullet, id);
					bulletFire(x, y, dir-35, 4.5, global.playerDamage*0.1, oMinonBullet, id);
				}
			}
			bulletDelay = bulletCoolDown;
		}
	} else {
		target = noone;
	}
}