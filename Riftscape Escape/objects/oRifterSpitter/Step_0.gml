event_inherited();
if (brainDead) {
    exit;
}
//path timer reduction
path_timer--;


// countdown
shoot_cooldown--;

// fire when ready, fires default bullet
if (shoot_cooldown < 60) {
	if (shoot_cooldown > 20) {
		flash += 0.18;
	}
	
	var a = ang mod 360;
	if (a < 0) a += 360;
	if (a mod 90 == 0) {
		image_index = 2;
	} else {
		image_index = 1;
	}
}
if (shoot_cooldown <= 0) {
	//point_direction(x, y, oTruePlayer.x+oTruePlayer.hsp*bullet_speed*0.1, oTruePlayer.y+oTruePlayer.vsp*bullet_speed*0.1);
	if (oPlayerManager.hasCircleTime && oTruePlayer.inCircle) {
		ang = point_direction(x, y, mouse_x, mouse_y);
	}
	var bullet = bulletFire(x, y, ang, bullet_speed, damage, oMiniBossBullet, id);
	bullet.canAccel = true;	
	bullet.canBounce = true;
	bullet.bounceTarget = oTruePlayer;
	bullet.tracking = 0.65;
	var bullet2 = bulletFire(x, y, ang+90, bullet_speed, damage, oMiniBossBullet, id);
	bullet2.canAccel = true;	
	bullet2.canBounce = true;
	bullet2.bounceTarget = oTruePlayer;
	bullet2.tracking = 0.65;
	var bullet3 = bulletFire(x, y, ang+180, bullet_speed, damage, oMiniBossBullet, id);
	bullet3.canAccel = true;
	bullet3.canBounce = true;
	bullet3.bounceTarget = oTruePlayer;
	bullet3.tracking = 0.65;
	var bullet4 = bulletFire(x, y, ang+270, bullet_speed, damage, oMiniBossBullet, id);
	bullet4.canAccel = true;
	bullet4.canBounce = true;
	bullet4.bounceTarget = oTruePlayer;
	bullet4.tracking = 0.65;
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