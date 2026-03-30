if (brainDead) {
    exit;
}
//path timer reduction
path_timer--;
if (enragedPoint >= enemey_hp && enraged == false) {
	enemSpeed -= 0.2;
	enraged = true;
}

flash = max(0, flash - 0.15);

// countdown
shoot_cooldown--;
// fire when ready, fires default bullet
if (shoot_cooldown <= 0) {
	recoil_timer--;
	if (recoil_timer <= 0) {
		fire_timer --;
		if (fire_timer > 0) {
			var counter = 0;
			if (enraged) {
				ang += 45
			}
			if (ang > 360) ang -= 360;
			for (var i = 0; i < 4; i++) {
			bulletFire(x, y, ang, bullet_speed, damage, oMiniBossBullet, id);
			ang += 90;
			}
			recoil_timer = recoil_cooldown;
			} else {
				shoot_cooldown = shoot_delay;
				recoil_timer = recoil_cooldown;
				fire_timer = fire_duration;
				enemSpeed += 0.035;
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