//path timer reduction
path_timer--;
flash = max(0, flash - 0.15);
if (enrage_point >= enemey_hp && enraged == false) {
	enemSpeed -= 1;
	bullet_speed = 1.5;
	fire_duration += 30;
	shoot_delay = 1;
	recoil_cooldown -= 6;
	enraged = true;
	enragedAngle = 1;
}
if (enraged) {
	enragedAngle = irandom_range(0, 359);
}
// countdown
shoot_cooldown--;
// fire when ready, fires default bullet
if (shoot_cooldown <= 0) {
	recoil_timer--;
	if (recoil_timer <= 0) {
		fire_timer --;
		if (fire_timer > 0) {
			if (enraged) {
				bulletAng = enragedAngle;
			} else if (oPlayerManager.hasCircleTime && oTruePlayer.inCircle) {
				bulletAng = point_direction(x, y, mouse_x, mouse_y);
			} else {
			bulletAng = point_direction(x, y, oTruePlayer.x, oTruePlayer.y);
		}
		bulletFire(x, y, bulletAng, bullet_speed, damage, oMiniBossBullet, id);
			recoil_timer = recoil_cooldown;
			} else {
				shoot_cooldown = shoot_delay;
				recoil_timer = recoil_cooldown;
				fire_timer = fire_duration;
				bullet_speed += 0.5;
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