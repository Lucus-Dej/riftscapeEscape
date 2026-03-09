if (brainDead) {
    exit;
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
		fire_timer --;
		angle += 2 + angleAdd;
		if (fire_timer > 0) {
			var ang = point_direction(x, y, oTruePlayer.x, oTruePlayer.y)
			if (oPlayerManager.hasCircleTime && oTruePlayer.inCircle) {
				ang = point_direction(x, y, mouse_x, mouse_y)
			}
			bulletFire(x, y, ang+angle, bullet_speed, damage, oMiniBossBullet, id)
			bulletFire(x, y, ang-angle, bullet_speed, damage, oMiniBossBullet, id)
			recoil_timer = recoil_cooldown;
			} else {
				shoot_cooldown = shoot_delay;
				fire_duration+= 3;
				fire_timer = fire_duration;
				angleAdd += 3;
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