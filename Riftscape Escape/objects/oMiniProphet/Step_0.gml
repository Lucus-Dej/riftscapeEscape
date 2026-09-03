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

x += irandom_range(-4, 4);
y += irandom_range(-4, 4);
// fire when ready
if (shoot_cooldown <= 0) {
	var dist = point_distance(x, y, oTruePlayer.x, oTruePlayer.y);
	var ranNum = irandom_range(1, 3);
	if ((ranNum == 1 || ranNum == 2) && dist <= 480 && hasWasp) {
		var tth = dist/bullet_speed;
		var futureX = oTruePlayer.x + oTruePlayer.hsp*tth*0.8;
		var futureY = oTruePlayer.y + oTruePlayer.vsp*tth*0.8;
		var dir = point_direction(x, y,futureX, futureY);
		
			var bullet = bulletFire(x, y, dir, bullet_speed, damage, oBadBullet, id);
			bullet.isGhost = true;
			bullet.image_xscale /= 2;
			bullet.image_yscale /= 2;
			bullet.existance /= 2;
			with (bullet) {
				if (layer_get_name(layer) != "Flying") {
					layer = layer_get_id("Flying");
				}
			}
	    shoot_cooldown = shoot_delay;
	} else {
		isDashing = true;
		path_end();
		path_timer = 999;
		pathfind(global.flyGrid, oTruePlayer, enemSpeed*8, id);
		dashTimer = dashDuration;
		shoot_cooldown = 999;
	}
}
if (isDashing) {
	if (dashTimer > 0) {
		dashTimer--;
		
	} else {
		isDashing = false;
		shoot_cooldown = shoot_delay;
		path_end();
		path_timer = 0;
		
	}
}