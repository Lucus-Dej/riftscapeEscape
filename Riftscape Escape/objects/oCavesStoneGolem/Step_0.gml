event_inherited();
if (brainDead) {
    exit;
}

var playerDir = point_direction(x, y, oTruePlayer.x, oTruePlayer.y); 
image_angle = playerDir+90;
var mouseDist = 999;
var firstPCheck = false;

if (!place_meeting(x, y, oLineCameraCheck)) {
	enemSpeed = initalSpeed;
} else {
	if (rageTimer < rageBreak) {
		rageTimer++;
		enemSpeed = 0;
	}
}
if (!halfRaged && !fullRaged && rageTimer > rageBreak*0.5) {
	halfRaged = true;
	image_index = 1;
}
if (!fullRaged && rageTimer >= rageBreak) {
	image_index = 2;
	fullRaged = true;
	speedBonus += 0.4;
	bullet_speed+= 2;
	enemSpeed = initalSpeed;
}
// countdown
if (shoot_cooldown > 0 && canSeePlayer) {
    shoot_cooldown--;
}

// fire when ready
if (shoot_cooldown <= 0) {
	var dist = point_distance(x, y, oTruePlayer.x, oTruePlayer.y);
	var tth = dist/bullet_speed;
	var futureX = oTruePlayer.x + oTruePlayer.hsp*tth*0.8;
	var futureY = oTruePlayer.y + oTruePlayer.vsp*tth*0.8;
	var dir = point_direction(x, y,futureX, futureY);
		var bullet = bulletFire(x, y, dir+20, bullet_speed, damage, oBadBullet, id);
		var bullet1 = bulletFire(x, y, dir, bullet_speed*0.6, damage, oBadBullet, id);
		var bullet2 = bulletFire(x, y, dir-20, bullet_speed, damage, oBadBullet, id);
    shoot_cooldown = shoot_delay;
}
