event_inherited();
if (brainDead) {
    exit;
}

if (!canSeePlayer) {
	enemSpeed = initalSpeed*15;
	image_alpha = 1;
} else if (canSeePlayer) {
	image_alpha = modifiedAlpha;
	enemSpeed = 0;
}
// countdown
if (shoot_cooldown > 0 && canSeePlayer) {
    shoot_cooldown--;
	modifiedAlpha = 0.35;
	var dist = point_direction(x, y, oTruePlayer.x, oTruePlayer.y);
	time = (clamp(dist / bullet_speed, 0, 30))+18;
	targetDir = point_direction(x, y, oTruePlayer.x+oTruePlayer.hsp*time, oTruePlayer.y+oTruePlayer.vsp*time);
	image_angle = targetDir-90;
}
if (chargeTime > 0) {
	
}
// fire when ready
if (shoot_cooldown <= 0) {
	enemSpeed = 0;
	chargeTime--;
	modifiedAlpha += 0.06;
	if (chargeTime <= 0) {
		bulletFire(x, y, targetDir, bullet_speed, damage, oSniperBullet, id);
	chargeTime = chargeCooldown;
    shoot_cooldown = shoot_delay;
	}
}