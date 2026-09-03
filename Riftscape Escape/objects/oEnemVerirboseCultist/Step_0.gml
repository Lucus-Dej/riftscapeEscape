event_inherited();
if (brainDead) {
    exit;
}

if (ranNum == -1) {
	// countdown
	if (shoot_cooldown > 0) {
	    shoot_cooldown--;
	} else {
		ranNum = irandom_range(1, 3)
	}
}
if (shoot_cooldown <= 0 && ranNum != -1) {
	enemSpeed = 0;
	var dist = point_distance(x, y, target.x, target.y);
	if (ranNum != 1 && (bulletCount < bulletLimit)) {
		bulletCount++;
		var dir = point_direction(x, y, target.x, target.y);
		var bullet = bulletFire(x+irandom_range(-64, 64), y+irandom_range(-64, 64), dir, bullet_speed, damage, oBadBullet, id);
		bullet.isGhost = true;
		bullet.canHome = true;
		bullet.ignorePlayerFrames = 48;
		bullet.canFriendlyFireOwner = true
		bullet.homeDuration = 120;
		bullet.turnSpeed = 1.4;
		bullet.homeSpeed = bullet_speed;
		bullet.canAccel = true;
		bullet.homingTarget = target;
		bullet.sprite_index = sHomingBullet;
	    
	} else if (ranNum == 1 && (bulletCount < bulletLimit)) {
		var dir = point_direction(x, y, target.x, target.y);
		bulletCount = bulletLimit;
		for (var i = 0; i < 2; i++) {
			var bullet = bulletFire(x+irandom_range(-64, 64), y+irandom_range(-64, 64), dir, bullet_speed*24, damage*1.4, oBadBullet, id);
			bullet.isGhost = true;
			bullet.canHome = true;
			bullet.image_xscale += 2;
			bullet.image_yscale += 2;
			bullet.ignorePlayerFrames = 48;
			bullet.canFriendlyFireOwner = true
			bullet.homeDuration = 600
			bullet.canFlash = true;
			bullet.existance = 600;
			bullet.turnSpeed = 2
			bullet.homeSpeed = bullet_speed*24;
			bullet.homingTarget = target;
			bullet.sprite_index = sHomingBullet;
		}
	} else {
		enemSpeed = baseSpeed;
		shoot_cooldown = shoot_delay;
		bulletCount = 0;
		ranNum = -1;
	}
}