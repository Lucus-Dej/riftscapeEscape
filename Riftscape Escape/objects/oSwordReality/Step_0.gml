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

if (mode == SWORDMODE.attacking) {
	// chase to where the oMouseTracker object was at the beginning of the mode switch. once they get within 8 or so pixels, they return back
	accelSpeed += 0.005;
	if (buffer < 6) {
		buffer++;
		if (buffer >= 6) {
			validForTp = true;
		}
	}
	
	var dir = point_direction(x, y, xTo, yTo);
	direction  -= clamp(angle_difference(direction, dir), -rot, rot)
	
	x += lengthdir_x(chaseSpeed, direction);
	y += lengthdir_y(chaseSpeed, direction);
	image_angle += 43;
	var dist = point_distance(x, y, xTo, yTo)
	if (dist <= 48 ) { //&& attackTimer >= attackDuration) {
		attackTimer = 0;
		mode = SWORDMODE.controlling;
		follow = oMouseTracker;
	}
} else if (mode == SWORDMODE.controlling) {
	if (attackTimer < attackDuration) {
		attackTimer++;
	} else {
		mode = SWORDMODE.returning;
	}
	if (oPlayerManager.swordAttPressed && validForTp) {
		oTruePlayer.x = x;
		oTruePlayer.y = y;
		instance_destroy();
	}
} else if (mode == SWORDMODE.returning) {
	follow = oTruePlayer;
	accelSpeed += 0.02;
	var dist = point_distance(x, y, follow.x, follow.y)
	if (dist <= 48 ) { //&& attackTimer >= attackDuration) {
		instance_destroy()
	}
}
if (instance_exists(follow)) {
	accelSpeed += 0.015;
	xTo = follow.x;
	yTo = follow.y;
	var dir = point_direction(x, y, follow.x, follow.y);
	direction  -= clamp(angle_difference(direction, dir), -rot, rot)
	
	x += lengthdir_x(chaseSpeed, direction);
	y += lengthdir_y(chaseSpeed, direction);
	
}
if (validForTp) {
	flash += flashRate;
	if (flash >= 1 || flash <= -1) {
		flashRate *= -1;
	}
} else {
	flash = 0;
}