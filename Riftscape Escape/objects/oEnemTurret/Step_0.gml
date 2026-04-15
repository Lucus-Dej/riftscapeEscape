if (brainDead) {
    exit;
}
var playerDir = point_direction(x, y, oTruePlayer.x, oTruePlayer.y); 
image_angle = playerDir+90;
if (!bossModApplied && isBoss) {
	bossModApplied = true;
	enemey_hp *= hpMult;
	base_speed *= speedMult;
	enemSpeed *= speedMult;
	damage *= dmgMult;
	shoot_delay /= cooldownMult;
	event_user(13);
}
path_timer--;
if (!canSeePlayer) {
	enemSpeed = base_speed*2;
	shoot_cooldown = shoot_delay;
} else if (canSeePlayer) {
	enemSpeed = 0;
}
// countdown
if (shoot_cooldown > 0 && canSeePlayer) {
    shoot_cooldown--;
}
flash = max(0, flash - 0.15);

// fire when ready
if (shoot_cooldown == 12 && fireToggle) {
	flash = 2;
}
if (shoot_cooldown <= 0) {
	if (oPlayerManager.hasCircleTime && oTruePlayer.inCircle) {
		var dir = point_direction(x, y, mouse_x, mouse_y);
		
		if (fireToggle) {
			bulletFire(x, y, dir, bullet_speed, damage, oBadBullet, id);
		} else {
			bulletFire(x, y, dir, bullet_speed, damage, oBadBullet, id);
			bulletFire(x, y, dir, bullet_speed, damage, oBadBullet, id);
		}
	} else {
		var dir = point_direction(x, y, oTruePlayer.x, oTruePlayer.y); 
		if (fireToggle) {
			bulletFire(x, y, dir, bullet_speed*1.2, damage, oBadBullet, id);
		} else {
			bulletFire(x, y, dir+40, bullet_speed, damage, oBadBullet, id);
			bulletFire(x, y, dir-40, bullet_speed, damage, oBadBullet, id);
		}
	}
	fireToggle = !fireToggle;
    shoot_cooldown = shoot_delay;
}
if (dragTimer > 0) {
    applyDrag(dragPower, dragDir, oWalls);
    dragTimer--;

    if (dragTimer <= 0) {
        path_timer = 0;
    }
}
if (path_timer <= 0) {
	var dir = point_direction(x, y, oTruePlayer.x, oTruePlayer.y); 
	image_angle = dir+90;
    path_timer = path_cooldown;
    pathfind(global.Grid, oTruePlayer, enemSpeed, id);
}