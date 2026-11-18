if (!instance_exists(host)) {
	instance_destroy();
	exit;
}
if (!targetFound) {
	var dir = image_angle;
	var dirX = x + lengthdir_x(1280, dir);
	var dirY = y + lengthdir_y(1280, dir);
	ds_list_clear(wallLine);
	ds_list_clear(nodeLine)
	collision_line_list(x, y, dirX, dirY, oIndestructable, true, false, wallLine, true);
	with (host) {
		collision_line_list(x, y, dirX, dirY, oVeriLaserNode, true, true, other.nodeLine, true);
	}
	var topNode = noone;
	var topWall = noone;
	
	if (ds_list_size(wallLine) > 0) {
		topWall = wallLine[|0];
	}
	if (ds_list_size(nodeLine) > 0) {
		topNode = nodeLine[|0];
		
	}
	if (instance_exists(topWall) || instance_exists(topNode)) {
		var lineDist = 9999;
		var hostDist = 9999;
		var pointX = 0;
		var pointY = 0;
		if (instance_exists(topWall)) {
			lineDist = point_distance(x, y, topWall.x, topWall.y);
		}
		if (instance_exists(topNode)) {
			hostDist = point_distance(x, y, topNode.x, topNode.y);
		}
		var dist = min(lineDist, hostDist)
		image_xscale = dist/scale;
	} else {
		image_xscale = 1280/scale;
	}
} 
if (targetFound && instance_exists(target)) {
	var dist = point_distance(host.x, host.y, target.x, target.y);
	image_xscale = dist/scale;
	image_angle = point_direction(x, y, target.x, target.y);
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

