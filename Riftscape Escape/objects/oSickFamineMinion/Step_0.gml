
chaseSpeed = baseChaseSpeed + famPower*0.05;
rot = baseRot + famPower;

damage = global.playerDamage*0.2 + (famPower * 0.008)

cooldown = baseCooldown - famPower;
dmgRefreshTime = cooldown*0.5;
if (dmgRefreshTime < 12) {
	dmgRefreshTime = 12;
}
if (mode != SICKLEMODE.recharging) {
	if (global.inCombat) {
		if (famPower > 0) {
			famPower -= 0.1;
		}
	} else {
		passivePowerTimer--;
		if (famPower > 0 && passivePowerTimer <= 0) {
			famPower -= 1;
			passivePowerTimer = 12;
		}
	}
} 

if (mode == SICKLEMODE.recharging) {
	//orbits around player either clockwise or counter clockwise based off of the "rotation" variable being iether -1 or 1
	//rot code here
	if (instance_exists(oTruePlayer)) {
		var dir = point_direction(x, y, oMouseTracker.x, oMouseTracker.y)
	    orbitAngle -= 4.3*rotation;
		
		var drawAngle = dir + orbitAngle;
		image_angle += 23*rotation;
	    orbitRadius = lerp(orbitRadius, orbitTargetRadius, 0.2);

	    x = oTruePlayer.x + lengthdir_x(orbitRadius, drawAngle);
	    y = oTruePlayer.y + lengthdir_y(orbitRadius, drawAngle);
	}
	delay++;
	if (delay > cooldown) {
		mode = SICKLEMODE.idle;
	}
} else if (mode == SICKLEMODE.idle) {
	//sits directly to the left and right of the player. waits for the player to click the "fire button"
	var dir = oPlayer.image_angle;
	orbitAngle = dir + 90*rotation;
	
	x = oTruePlayer.x + lengthdir_x(orbitRadius, orbitAngle);
	y = oTruePlayer.y + lengthdir_y(orbitRadius, orbitAngle);
	image_xscale = rotation*-1;
	image_yscale = rotation*-1;
	image_angle = dir + 90*rotation;
	

	if ((keyboard_check(vk_space) or mouse_check_button(mb_left))) {
		mode = SICKLEMODE.attacking;
		if (global.inCombat) {
			missCount++;
		}
		
		xTo = oMouseTracker.x;
		yTo = oMouseTracker.y;
		follow = oMouseTracker;
	}
} else if (mode == SICKLEMODE.attacking) {
	
	// chase to where the oMouseTracker object was at the beginning of the mode switch. once they get within 8 or so pixels, they return back
	accelSpeed += 0.005;
	var dir = point_direction(x, y, xTo, yTo);
	direction  -= clamp(angle_difference(direction, dir), -rot, rot)
	
	x += lengthdir_x(chaseSpeed, direction);
	y += lengthdir_y(chaseSpeed, direction);
	image_angle += 17*rotation;
	var dist = point_distance(x, y, xTo, yTo)
	//if (attackTimer < attackDuration) {
	//	attackTimer++;
	//}
	if (dist <= 32 ) { //&& attackTimer >= attackDuration) {
		attackTimer = 0;
		mode = SICKLEMODE.recovering;
		follow = oTruePlayer;
	}
} else if (mode == SICKLEMODE.recovering) {
	if (famPower > 0 && global.inCombat) {
		famPower -= missCount*0.25;
		if (famPower < 0) { 
			famPower = 0
		}
	}
	
	image_angle += 17*rotation;
	accelSpeed += 0.025;
	xTo = follow.x;
	yTo = follow.y;
	x += (xTo - x)/(minionSpeed);
	y += (yTo - y)/(minionSpeed);
	var dist = point_distance(x, y, follow.x, follow.y)
	if (dist <= 80) {
		mode = SICKLEMODE.recharging;
		delay = 0;
		follow = oTruePlayer;
	}
}

if (instance_exists(follow) && follow != oTruePlayer) {
	//accelSpeed += 0.005;
	
} else if (follow == oTruePlayer) {
	xTo = follow.x;
	yTo = follow.y;
	
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
