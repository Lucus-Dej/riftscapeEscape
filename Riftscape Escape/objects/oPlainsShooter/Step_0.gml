event_inherited();
if (brainDead) {
    exit;
}

if (!canSeePlayer || point_distance(x, y, oTruePlayer.x, oTruePlayer.y) > 320) {
	enemSpeed = initalSpeed*2.8;
	bullet_speed = 9.5;
} else if (canSeePlayer) {
	enemSpeed = initalSpeed;
	bullet_speed = baseBulletSpeed;
}

//path timer reduction
path_timer--;


// countdown
shoot_cooldown--;

// fire when ready, fires default bullet
if (shoot_cooldown <= 0) {
	recoil_timer--;
	if (recoil_timer <= 0) {
		fire_timer ++
		if (fire_timer < fire_duration) {
			var ang = point_direction(x, y, oTruePlayer.x+oTruePlayer.hsp*bullet_speed*0.2, oTruePlayer.y+oTruePlayer.vsp*bullet_speed*0.2);
			var bullet = bulletFire(x, y, ang, bullet_speed, damage, oMiniBossBullet, id);
			bullet.canDecel = true;
			bullet.decelRate = 0.08;
			var bullet2 = bulletFire(x, y, ang+35, bullet_speed, damage, oMiniBossBullet, id);
			bullet2.canDecel = true;
			bullet2.decelRate = 0.08;
			var bullet1 = bulletFire(x, y, ang-35, bullet_speed, damage, oMiniBossBullet, id);
			bullet1.canDecel = true;
			bullet1.decelRate = 0.08;
			recoil_timer = recoil_cooldown;
			} else {
				if (bullet_speed > 8) {
					bullet_speed += 0.5;
				}
				shoot_cooldown = shoot_delay;
				recoil_timer = recoil_cooldown;
				fire_timer = 0;
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