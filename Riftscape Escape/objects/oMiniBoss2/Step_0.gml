event_inherited();
if (brainDead) {
    exit;
}
// countdown
shoot_cooldown--;

// fire when ready, fires default bullet
if (shoot_cooldown <= 0) {
	recoil_timer--;
	if (recoil_timer <= 0) {
		fire_timer ++
		if (fire_timer < fire_duration) {
			var ang = point_direction(x, y, oTruePlayer.x+oTruePlayer.hsp*bullet_speed*0.2, oTruePlayer.y+oTruePlayer.vsp*bullet_speed*0.2);
			if (isBoss) {
				var bullet = bulletFire(x, y, ang+180, bullet_speed, damage, oMiniBossBullet, id);
				bullet.canDecel = true;
			bullet.decelRate = 0.08;
			}
			var bullet = bulletFire(x, y, ang, bullet_speed, damage, oMiniBossBullet, id);
			bullet.canDecel = true;
			bullet.decelRate = 0.08;
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
shoot_cooldown--;
if (shoot_cooldown > 0) {
	enemSpeed = initalSpeed;
} 
if (shoot_cooldown < 0) {
	enemSpeed = 0.2;
}
if (shoot_cooldown < -1*shoot_delay/2) {
	shoot_cooldown = irandom(shoot_delay);
}

if (shoot_cooldown <= 0 && on_cooldown = true) {
	on_cooldown = false;
}
