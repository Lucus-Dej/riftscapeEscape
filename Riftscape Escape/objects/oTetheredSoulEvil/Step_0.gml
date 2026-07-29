if (!instance_exists(follow)) {
	instance_destroy()
}
if (oItemManager.hasLostCrown && instance_exists(follow)) {
	bulletCoolDown = ((follow. enemyHP/follow.maxHP)*100)/2;
} else {
	bulletCoolDown = ((follow. enemyHP/follow.maxHP)*100);
}
if (follow != noone) {
	xTo = follow.x;
	yTo = follow.y;
}
clamp(bulletCoolDown, 10, 100)
x += (xTo - x)/(minionSpeed);
y += (yTo - y)/(minionSpeed);
if (instance_exists(oEnemy)) {
	
	
	if (bulletDelay > 0)  {
		bulletDelay --;
	}
	if (bulletDelay <= 0) {
		if (evil) {
			target = instance_nearest(x, y, oTruePlayer)
			bulletFireAt(x, y, target, 4.5, damage, oBadBullet, id)
			bulletDelay = bulletCoolDown;
		} else {
			target = instance_nearest(x, y, oEnemy)
			bullet = instance_create_layer(x, y, "Instances", oMinonBullet);
			bullet.damage = damage;
			bullet.direction = point_direction(x, y,target.x, target.y);
			bullet.speed = 4.5;
			bulletDelay = bulletCoolDown;
		}
		
	}
} else {
	target = noone;
}