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
			var rocket = bulletFire(x, y, dir, bullet_speed*0.65, damage, oBadBullet, id);
			rocket.canFriendlyFireOwner = true;
			rocket.existance = 400;
			rocket.explodeTimer = 400;
			rocket.canExplode = true;
			rocket.explodeObj = oExplosiveRuneBoom;
			rocket.homingTarget = oTruePlayer;
			rocket.canFlash = true;
			rocket.canHome = true;
			rocket.turnSpeed = 5;
			rocket.homeSpeed = bullet_speed*0.65;
			rocket.homeDuration = 120;
			rocket.sprite_index = sRocket;
		} else {
			bulletFire(x, y, dir+40, bullet_speed, damage, oBadBullet, id);
			bulletFire(x, y, dir-40, bullet_speed, damage, oBadBullet, id);
		}
	fireToggle = !fireToggle;
    shoot_cooldown = shoot_delay;
}