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
		if (fire_timer > 0) {
			var ang = point_direction(x, y, oTruePlayer.x, oTruePlayer.y);
			if (oPlayerManager.hasCircleTime && oTruePlayer.inCircle) {
				ang = point_direction(x, y, mouse_x, mouse_y);
			}
			bulletFire(x, y, ang, bullet_speed, damage, oMiniBossBullet, id);
			recoil_timer = recoil_cooldown;
			} else {
				if (fire_duration > 3) {
					fire_duration -= 0.25;
					shoot_delay -= 1;
				}
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
    pathfind(global.Grid, oTruePlayer, enemSpeed);
}