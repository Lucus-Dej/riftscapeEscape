if (!instance_exists(host)) {
//	instance_destroy();
//	exit;
} else {
	x = host.x;
	y = host.y;
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

if (trackingID != 0) {
	var dir = image_angle;
	var dirX = x + lengthdir_x(1280, dir);
	var dirY = y + lengthdir_y(1280, dir);
	ds_list_clear(wallLine);
	ds_list_clear(nodeLine)
	collision_line_list(x, y, dirX, dirY, oIndestructable, true, false, wallLine, true);
	var topNode = noone;
	var topWall = noone;
	
	if (ds_list_size(wallLine) > 0) {
		topWall = wallLine[|0];
	}

	if (instance_exists(topWall)) {
		var lineDist = 9999;
		var hostDist = 9999;
		var pointX = 0;
		var pointY = 0;
		if (instance_exists(topWall)) {
			lineDist = point_distance(x, y, topWall.x, topWall.y);
		}
		
		var dist = lineDist;
		image_xscale = dist/scale;
	} else {
		image_xscale = 1280/scale;
	}
	
}


if (decay) {
		if (image_alpha > 0.2) {
			image_alpha -= 0.1;
		} else {
			instance_destroy();
			
			//var i = array_get_index(host.unleashedLaserSpiralArray, id);
			//array_delete(host.unleashedLaserSpiralArray, i, 1);
		}
	}
