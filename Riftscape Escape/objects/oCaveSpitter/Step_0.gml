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
	ang = point_direction(x, y, oTruePlayer.x+oTruePlayer.hsp*bullet_speed*0.1, oTruePlayer.y+oTruePlayer.vsp*bullet_speed*0.1);
	if (oPlayerManager.hasCircleTime && oTruePlayer.inCircle) {
		ang = point_direction(x, y, mouse_x, mouse_y);
	}
	var bullet = bulletFire(x, y, ang, bullet_speed, damage, oMiniBossBullet, id);
			
	var bullet2 = bulletFire(x, y, ang+90, bullet_speed, damage, oMiniBossBullet, id);
			
	var bullet3 = bulletFire(x, y, ang+180, bullet_speed, damage, oMiniBossBullet, id);
	
	var bullet4 = bulletFire(x, y, ang+270, bullet_speed, damage, oMiniBossBullet, id);
			
	shoot_cooldown = shoot_delay;
	recoil_timer = recoil_cooldown;
	fire_timer = 0;
	ang += 45;
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