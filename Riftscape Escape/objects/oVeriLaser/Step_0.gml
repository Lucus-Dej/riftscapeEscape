if (!instance_exists(host)) {
	instance_destroy();
	exit;
}

if (!targetFound && target == noone) {
	var dir = image_angle;
	var dirX = x + lengthdir_x(640, dir);
	var dirY = y + lengthdir_y(640, dir);
	var line = collision_line(x, y, dirX, dirY, oIndestructable, true, false)

	if (instance_exists(line)) {
		var dist = point_distance(host.x, host.y, line.x, line.y);
		image_xscale = dist/scale;
	} else {
		image_xscale = 640/scale;
	}
} else if (instance_exists(target) && !targetFound) {
	var dir = image_angle;
	var dirX = x + lengthdir_x(640, dir);
	var dirY = y + lengthdir_y(640, dir);
	var line = collision_line(x, y, dirX, dirY, target, true, false);
	
	if (instance_exists(line)) {
		targetFound = true;
	}
} else if (targetFound && instance_exists(target)) {
	var dist = point_distance(host.x, host.y, target.x, target.y);
	image_xscale = dist/scale;
	image_angle = point_direction(host.x, host.y, target.x, target.y);
}



if (array_length(damageArray) > 0) {
	for (var i = array_length(damageArray) - 1; i >= 0; i--) {
		if (damageTimerArray[i] < dmgRefreshTime) {
			damageTimerArray[i]++;
		} else {
			array_delete(damageTimerArray, i, 1);
			array_delete(damageArray, i, 1);
		}
	}
}

