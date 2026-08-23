event_inherited();
if (brainDead) {
    exit;
}

var playerDir = point_direction(x, y, oTruePlayer.x, oTruePlayer.y); 
image_angle = playerDir+90;

if (!canSeePlayer) {
	tempSpeedMult = 3;
} else if (canSeePlayer) {
	tempSpeedMult = 1;
}
// countdown
if (shoot_cooldown > 0 && canSeePlayer) {
    shoot_cooldown--;
}
if (phasePoint1 >=  enemyHP && enraged == false) {
	speedBonus += 1.7;
	bullet_speed -= 3;
	fire_duration += 12;
	shoot_delay += 10;
	recoil_cooldown -= 2;
	enraged = true;
}
// countdown
shoot_cooldown--;
if (move = -1) {
	move = irandom_range(1, 10);
}
// fire when ready, fires default bullet
if (shoot_cooldown <= 0 && move > -1) {
	var playerAng = point_direction(x, y, oTruePlayer.x, oTruePlayer.y);
	if (enraged) {
		//move++;
	}
	if (move >= 7) {
		var c =  bulletFire(x, y, playerAng+25, bullet_speed*1.5, damage*1.2, oBossBullet, id);
		var d =  bulletFire(x, y, playerAng-25, bullet_speed*1.5, damage*1.2, oBossBullet, id);
		move = -1;
		shoot_cooldown = shoot_delay;
	} else {
		recoil_timer--;
	if (recoil_timer <= 0) {
		fire_timer --;
		if (fire_timer > 0) {
			if (!enraged) {
				var bullet = bulletFireAt(x, y, oTruePlayer, bullet_speed, damage, oMiniBossBullet, id)
			} else {
				var a =  bulletFire(x, y, playerAng - 35 - fire_timer*4, bullet_speed, damage, oBadBullet, id);
				var b =  bulletFire(x, y, (playerAng + 35 + fire_timer*4),bullet_speed, damage, oBadBullet, id);
				if (fire_timer == 1) {
					var c =  bulletFire(x, y, playerAng, bullet_speed*0.4, damage*2, oBadBullet, id);
					c.image_xscale += 1;
					c.image_yscale += 1;
					c.canAccel = true;
				}
			}		
			recoil_timer = recoil_cooldown;
	} else {
		move = -1;
		shoot_cooldown = shoot_delay;
		recoil_timer = recoil_cooldown;
		fire_timer = fire_duration;
		}
	}
	}
}