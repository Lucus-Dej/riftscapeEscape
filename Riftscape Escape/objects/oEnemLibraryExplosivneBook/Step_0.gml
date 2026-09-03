event_inherited();
if (brainDead) {
    exit;
}


/*
if (!canSeePlayer || point_distance(x, y, oTruePlayer.x, oTruePlayer.y) > 256) {
	enemSpeed = initalSpeed*4.2;
} else if (canSeePlayer) {
	enemSpeed = initalSpeed;
} */
// countdown
if (shoot_cooldown > 0) {
    shoot_cooldown--;
}

x += irandom_range(-2, 2);
y += irandom_range(-2, 2);
// fire when ready
if (shoot_cooldown <= 0) {
	var dist = point_distance(x, y, oTruePlayer.x, oTruePlayer.y);
	var ranNum = irandom_range(1, 2);
	if (ranNum == 1 && dist < 420) {
		var dir = 0;
		var inc = 360/3;
		var incAdjust = irandom_range(1, 2);
		var ranHoming = irandom_range(8, 8)
		for (var i = 0; i < 8; i ++) {
			var bullet = bulletFire(x, y, dir+incAdjust*60+inc*i, bullet_speed, damage, oBadBullet, id);
			bullet.isGhost = true;
			bullet.image_xscale /= 2;
			bullet.image_yscale /= 2;
			if (i == ranHoming) {
				bullet.canHome = true;
				bullet.canFriendlyFireOwner = true
				bullet.homeDuration = 120;
				bullet.turnSpeed = 2;
				bullet.homeSpeed = bullet_speed;
				bullet.homingTarget = oTruePlayer;
				bullet.sprite_index = sHomingBullet;
			}
			with (bullet) {
				if (layer_get_name(layer) != "Flying") {
					layer = layer_get_id("Flying");
				}
			}
		}
	    shoot_cooldown = shoot_delay;
	} else {
		isDashing = true;
		path_end();
		path_timer = 999;
		shoot_cooldown = 999;
		dashDir = point_direction(x, y, oTruePlayer.x, oTruePlayer.y);
		dashTimer = dashDuration;
	}
}
if (isDashing) {
	if (dashTimer > 0) {
		dashTimer--;
		x += lengthdir_x(dashSpeed, dashDir);
		y += lengthdir_y(dashSpeed, dashDir);
	} else {
		isDashing = false;
		shoot_cooldown = shoot_delay;
		path_end();
		path_timer = 0;
	}
}
