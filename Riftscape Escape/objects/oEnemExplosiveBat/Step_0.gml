event_inherited();
if (brainDead) {
    exit;
}


/*
if (!canSeePlayer || point_distance(x, y, oTruePlayer.x, oTruePlayer.y) > 256) {
	enemSpeed = initalSpeed*4.2;
} else if (canSeePlayer) {
	enemSpeed = initalSpeed;
} */
// countdown
var targetDist = point_distance(x, y, oTruePlayer.x, oTruePlayer.y);
if (!isDashing && shoot_cooldown > 0) {
	shoot_cooldown--;
}
if (isDashing) {
	if (dashTimer > 0) {
		dashTimer--;
		x += lengthdir_x(dashSpeed, dashDir);
		y += lengthdir_y(dashSpeed, dashDir);
	} else {
		isDashing = false;
		shoot_cooldown = irandom_range(shoot_delay*0.5, shoot_delay*2);
		path_end();
		path_timer = 0;
	}
}

x += irandom_range(-3, 3);
y += irandom_range(-3, 3);
// fire when ready
if (shoot_cooldown <= 0) {
	var dist = point_distance(x, y, oTruePlayer.x, oTruePlayer.y);
	var ranNum = irandom_range(1, 8);
	
	isDashing = true;
	path_end();
	path_timer = 999;
		//pathfind(global.flyGrid, oTruePlayer, enemSpeed*10, id);
	dashDir = point_direction(x, y, oTruePlayer.x, oTruePlayer.y);
	dashTimer = dashDuration;
	shoot_cooldown = 999;
}
