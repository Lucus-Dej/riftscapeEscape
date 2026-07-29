event_inherited();
if (brainDead) {
    exit;
}
flash = max(0, flash - 0.15);


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
	var bullet = bulletFire(x, y, ang, bullet_speed, damage, oMiniBossBullet, id);
	bullet.canAccel = true;
	var bullet2 = bulletFire(x, y, ang+90, bullet_speed, damage, oMiniBossBullet, id);
	bullet2.canAccel = true;	
	var bullet3 = bulletFire(x, y, ang+180, bullet_speed, damage, oMiniBossBullet, id);
	bullet3.canAccel = true;
	var bullet4 = bulletFire(x, y, ang+270, bullet_speed, damage, oMiniBossBullet, id);
	bullet4.canAccel = true;
	shoot_cooldown = shoot_delay;
	recoil_timer = recoil_cooldown;
	fire_timer = 0;
	ang += 45;
}