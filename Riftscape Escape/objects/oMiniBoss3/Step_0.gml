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
			var ang = 0;
			if (ang > 360) ang -= 360;
			while (ang < 360) {
			bulletFire(x, y, ang, bullet_speed, damage, oMiniBossBullet, id);
			ang += 90;
			}
			recoil_timer = recoil_cooldown;
			} else {
				shoot_cooldown = shoot_delay;
				recoil_timer = recoil_cooldown;
				fire_timer = fire_duration;
				enemSpeed += 0.045;
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