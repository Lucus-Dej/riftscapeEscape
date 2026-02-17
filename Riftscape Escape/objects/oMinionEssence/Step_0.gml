existance--;
if (existance <= 0) {
	instance_destroy();
}
if (oPlayerManager.hasMinionReality) {
	minionSpeed = 25;
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
	if (oPlayerManager.hasMinionFate) {
		fateBullet = irandom_range(1, 10)
	if (fateBullet == 10) {
		bullet = instance_create_layer(x, y, "Instances", oMinionFateBullet);
		bullet.direction = point_direction(x, y, mouse_x, mouse_y);
		bullet.speed = 3;
		bullet.damage = 1.5*global.playerDamage;
	} else {
		bullet = instance_create_layer(x, y, "Instances", oMinonBullet);
		bullet.direction = point_direction(x, y, mouse_x, mouse_y);
		bullet.speed = 4.5;
		bullet.damage = global.playerDamage/6;
		}
	} else {
		 bullet = instance_create_layer(x, y, "Instances", oMinonBullet);
		bullet.direction = point_direction(x, y, mouse_x, mouse_y);
		bullet.speed = 4.5;
		bullet.damage = global.playerDamage/6;
	}
	fire = false;
} else if (oPlayerManager.hasMinionThought) {
	if (instance_exists(oEnemy)) {
		target = instance_nearest(x, y, oEnemy)
		if (bulletDelay > 0)  {
			bulletDelay --;
		}
		if (bulletDelay <= 0) {
			if (oPlayerManager.hasMinionFate) {
				fateBullet = irandom_range(1, 10)
			}
			if (fateBullet == 10) {
				bullet = instance_create_layer(x, y, "Instances", oMinionFateBullet);
				bullet.direction = point_direction(x, y,target.x, target.y);
				bullet.speed = 4;
				bulletDelay = global.bullet_delay/1+(global.playerLife/10)+(global.playerTime/10);
				bullet.damage = bullet.damage = 1.5*global.playerDamage;
			} else {
			 bullet = instance_create_layer(x, y, "Instances", oMinonBullet);
			 bullet.direction = point_direction(x, y,target.x, target.y);
			 bullet.speed = 4.5;
			 bulletDelay = global.bullet_delay/1+(global.playerLife/10)+(global.playerTime/10);
			 bullet.damage = global.playerDamage/6;
			}
		}
	} else {
		target = noone;
	}
}