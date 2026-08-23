
/*
if (!canSeePlayer || point_distance(x, y, oTruePlayer.x, oTruePlayer.y) > 256) {
	enemSpeed = initalSpeed*4.2;
} else if (canSeePlayer) {
	enemSpeed = initalSpeed;
} */
// countdown
var targetDist = point_distance(x, y, oTruePlayer.x, oTruePlayer.y);
image_alpha =1 - targetDist/maxDist;
if (!isDashing && shoot_cooldown > 0) {
	shoot_cooldown--;
	if (targetDist > maxDist/2) {
		shoot_cooldown -= 4;
	}
}


x += random_range(-0.5, 0.5);
y += random_range(-0.5, 0.5);
// fire when ready
if (shoot_cooldown <= 0 && instance_exists(oTruePlayer)) {
	    shoot_cooldown = shoot_delay;
		isDashing = true;
		path_end();
		path_timer = 999;
		shoot_cooldown = 999;
		dashDir = point_direction(x, y, oTruePlayer.x, oTruePlayer.y);
		dashTimer = dashDuration;
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
path_timer--;
if (path_timer <= 0 && !isDashing) {
    path_timer = path_cooldown;
	search = pathfind(global.flyGrid, oTruePlayer, enemSpeed, id);
    
}