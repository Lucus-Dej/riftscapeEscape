event_inherited();
if (brainDead) {
    exit;
}
var playerDir = point_direction(x, y, oTruePlayer.x, oTruePlayer.y); 
image_angle = playerDir+90;

if (!canSeePlayer) {
	enemSpeed = initalSpeed*2;
	shoot_cooldown = shoot_delay;
} else if (canSeePlayer) {
	enemSpeed = 0;
}
// countdown
if (shoot_cooldown > 0 && canSeePlayer) {
    shoot_cooldown--;
}

// fire when ready
if (shoot_cooldown == 12 && fireToggle) {
	flash = 2;
}
if (shoot_cooldown <= 0) {
		var dir = point_direction(x, y, oTruePlayer.x, oTruePlayer.y); 
		if (fireToggle) {
			bulletFire(x, y, dir, bullet_speed*1.2, damage, oBadBullet, id);
		} else {
			bulletFire(x, y, dir+40, bullet_speed, damage, oBadBullet, id);
			bulletFire(x, y, dir-40, bullet_speed, damage, oBadBullet, id);
		}
	fireToggle = !fireToggle;
    shoot_cooldown = shoot_delay;
}