if (follow != noone) {
	xTo = follow.x;
	yTo = follow.y;
}
clamp(bulletCoolDown, 10, 100)
bulletCoolDown = (oPlayerManager.uiHealth);
x += (xTo - x)/(minionSpeed);
y += (yTo - y)/(minionSpeed);
if (instance_exists(oEnemy)) {
	target = instance_nearest(x, y, oEnemy)
	if (bulletDelay > 0)  {
		bulletDelay --;
	}
	if (bulletDelay <= 0) {
	 bullet = instance_create_layer(x, y, "Instances", oMinonBullet);
	 bullet.damage = damage;
	 bullet.direction = point_direction(x, y,target.x, target.y);
	 bullet.speed = 4.5;
	 bulletDelay = bulletCoolDown;
	}
} else {
	target = noone;
}