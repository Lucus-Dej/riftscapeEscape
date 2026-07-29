
chaseSpeed = baseChaseSpeed + pestPower;
rot = baseRot + pestPower;
damage = 0.01 + (pestPower * 0.005)

cooldown = baseCooldown - pestPower;


if (primed) {
    //follow = noone;
	ds_list_clear(targetList);
    collision_circle_list(x, y, 128, oEnemy, false, false, targetList, true);
	if (ds_list_size(targetList) > 0) {
		follow = noone;
		for (var i = 0; i < ds_list_size(targetList); i++) {
			var enem = targetList[| i];
	        if (!array_contains(damageArray, enem) && instance_exists(enem)) {
	            follow = enem;
	            break;
	        } 
	    }
		if (follow == noone) {
			follow = oTruePlayer;
		}
	} else {
		
	}
}
if (instance_exists(follow) && follow != oTruePlayer) {
	accelSpeed += 0.005;
	xTo = follow.x;
	yTo = follow.y;
	var dir = point_direction(x, y, follow.x, follow.y);
	direction  -= clamp(angle_difference(direction, dir), -rot, rot)
	show_debug_message(direction)
	
	x += lengthdir_x(chaseSpeed, direction);
	y += lengthdir_y(chaseSpeed, direction);
	image_angle = direction - 45
	
} else if (follow == oTruePlayer) {
	xTo = follow.x;
	yTo = follow.y;
	var dir = point_direction(x, y, oMouseTracker.x, oMouseTracker.y)
	image_angle = dir - 45
	x += (xTo - x)/(minionSpeed);
	y += (yTo - y)/(minionSpeed);
}
if (!instance_exists(follow)) {
	follow = oTruePlayer;
	accelSpeed = 0;
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
