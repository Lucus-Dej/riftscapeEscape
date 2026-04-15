if (brainDead) {
    exit;
}
var playerDir = point_direction(x, y, oTruePlayer.x, oTruePlayer.y); 
if (!bossModApplied && isBoss) {
	bossModApplied = true;
	enemey_hp *= hpMult;
	base_speed *= speedMult;
	enemSpeed *= speedMult;
	damage *= dmgMult;
	shoot_delay /= cooldownMult;
	event_user(13);
}

//path timer reduction
path_timer--;
if (!canSeePlayer) {
	enemSpeed = base_speed*3;
} else if (canSeePlayer) {
	enemSpeed = base_speed;
}
// countdown
if (shoot_cooldown > 0 && canSeePlayer) {
    shoot_cooldown--;
}
flash = max(0, flash - 0.15);
if (phasePoint1 >= enemey_hp && enraged == false) {
	base_speed += 1.7;
	bullet_speed -= 3;
	fire_duration += 12;
	shoot_delay += 10;
	recoil_cooldown -= 2;
	enraged = true;
}
// countdown
shoot_cooldown--;
// fire when ready, fires default bullet
if (shoot_cooldown <= 0) {
	recoil_timer--;
	if (recoil_timer <= 0) {
		fire_timer --;
		if (fire_timer > 0) {
			if (oPlayerManager.hasCircleTime && oTruePlayer.inCircle) {
				var circleAng = point_direction(x, y, mouse_x, mouse_y);
				var a = bulletFire(x, y, circleAng, bullet_speed, damage, oBadBullet, id);
				if (enraged) {
					var b = bulletFire(x, y, circleAng, bullet_speed, damage, oBadBullet, id);
				}
		} else {
			if (!enraged) {
				var bullet = bulletFireAt(x, y, oTruePlayer, bullet_speed, damage, oMiniBossBullet, id)
				} else {
				var playerAng = point_direction(x, y, oTruePlayer.x, oTruePlayer.y);
				var a =  bulletFire(x, y, playerAng - 25 - fire_timer*4, bullet_speed, damage, oBadBullet, id);
				var b =  bulletFire(x, y, (playerAng + 25 +fire_timer*4),bullet_speed, damage, oBadBullet, id);
				}
			}		
			recoil_timer = recoil_cooldown;
	} else {
		shoot_cooldown = shoot_delay;
		recoil_timer = recoil_cooldown;
		fire_timer = fire_duration;
		}
	}
}
//pathfinding
if (dragTimer > 0) {
    applyDrag(dragPower, dragDir, oWalls);
    dragTimer--;

    if (dragTimer <= 0) {
        path_timer = 0;
    }
}

if (path_timer <= 0) {
    path_timer = path_cooldown;
    pathfind(global.Grid, oTruePlayer, enemSpeed, id);
}