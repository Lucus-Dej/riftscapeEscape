if (brainDead) {
    exit;
}
if (!canSeePlayer || point_distance(x, y, oTruePlayer.x, oTruePlayer.y) > 320) {
	enemSpeed = base_speed*2.8;
} else if (canSeePlayer) {
	enemSpeed = base_speed;
}
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
flash = max(0, flash - 0.15);


// countdown
shoot_cooldown--;

// fire when ready, fires default bullet
if (shoot_cooldown <= 0) {
	recoil_timer--;
	if (recoil_timer <= 0) {
		fire_timer ++
		if (fire_timer < fire_duration) {
			var ang = point_direction(x, y, oTruePlayer.x+oTruePlayer.hsp*bullet_speed*0.2, oTruePlayer.y+oTruePlayer.vsp*bullet_speed*0.2);
			if (oPlayerManager.hasCircleTime && oTruePlayer.inCircle) {
				ang = point_direction(x, y, mouse_x, mouse_y);
			}
			var bullet = bulletFire(x, y, ang, bullet_speed, damage, oMiniBossBullet, id);
			bullet.type = 1;
			var bullet2 = bulletFire(x, y, ang+35, bullet_speed, damage, oMiniBossBullet, id);
			bullet2.type = 1;
			var bullet1 = bulletFire(x, y, ang-35, bullet_speed, damage, oMiniBossBullet, id);
			bullet1.type = 1;
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