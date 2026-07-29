event_inherited();
if (brainDead) {
    exit;
}

var playerDir = point_direction(x, y, oTruePlayer.x, oTruePlayer.y); 
image_angle = playerDir+90;


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
	modifiedAlpha = 0.25;
	var dist = point_direction(x, y, oTruePlayer.x, oTruePlayer.y);
	time = (clamp(dist / bullet_speed, 0, 30))+9;
	targetDir = point_direction(x, y, oTruePlayer.x+oTruePlayer.hsp*time, oTruePlayer.y+oTruePlayer.vsp*time);
}
if (chargeTime > 0) {
	
}
// fire when ready
if (shoot_cooldown <= 0) {
	enemSpeed = 0;
	chargeTime--;
	modifiedAlpha += 0.06;
	if (chargeTime <= 0) {
		var bul = bulletFire(x, y, targetDir+25, bullet_speed*0.9, damage, oSniperBullet, id);
		var bul1 = bulletFire(x, y, targetDir, bullet_speed, damage, oSniperBullet, id);
		var bul3 = bulletFire(x, y, targetDir, bullet_speed*0.4, damage, oSniperBullet, id);
		bul3.canAccel = true;
		bul3.canBounce = true;
		bul3.bounceTarget = oTruePlayer;
		bul3.tracking = 0.8;
		var bul2 = bulletFire(x, y, targetDir-25, bullet_speed*0.9, damage, oSniperBullet, id);
		chargeTime = chargeCooldown;
    shoot_cooldown = shoot_delay;
	}
	
}