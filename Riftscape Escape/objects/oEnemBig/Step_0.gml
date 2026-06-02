event_inherited();
if (brainDead) {
    exit;
}

path_timer--;
if (!canSeePlayer) {
	enemSpeed = base_speed;
} else if (canSeePlayer) {
	enemSpeed = 0;
}
// countdown
if (shoot_cooldown > 0) {
    shoot_cooldown--;
}


// fire when ready
if (shoot_cooldown <= 0) {
	if (oPlayerManager.hasCircleTime && oTruePlayer.inCircle) {
		var circdir = point_direction(x, y, mouse_x, mouse_y);
		var bullet = bulletFire(x, y, circdir, bullet_speed, damage, oBadBullet, id);
	} else {
		var bullet = bulletFire(x, y, dir, bullet_speed, damage, oBadBullet, id);
		var bullet2 = bulletFire(x, y, dir+180, bullet_speed, damage, oBadBullet, id);
		dir += 37;
	}
	shoot_cooldown = shoot_delay
}
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

if (isBoss) {
	l = irandom(750/cooldownMult)
	if (l == 1) {
	var spawn = instance_create_layer(x, y, "Instances", oEnemSpider);
	if (isBoss) {
		spawn.base_speed += 0.2;
		spawn.enemey_hp -= 0.5;
		
	}
	spawn.xp = 0;
}
}

