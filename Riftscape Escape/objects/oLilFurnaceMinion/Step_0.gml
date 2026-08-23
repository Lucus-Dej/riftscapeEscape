if (instance_exists(target)) {
	var dir = point_direction(x, y, target.x, target.y);
	direction  -= clamp(angle_difference(direction, dir), -12, 12)
	var dist = point_distance(x, y, target.x, target.y);
	if (dist > 32) {
		accelSpeed += 2;
	} else {
		if (accelSpeed > 0) {
			accelSpeed -= 0.15;
			if (accelSpeed < 0) {
				accelSpeed = 0
			}
		}
	}
	x += lengthdir_x(chaseSpeed, direction);
	y += lengthdir_y(chaseSpeed, direction);
	
} else {
	target = instance_nearest(x, y, oEnemy);
	if (target == noone) {
		instance_destroy();
	}
}