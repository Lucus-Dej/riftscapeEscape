if (iframe >= 0) {
	if (instance_exists(owner)) {
		if (!place_meeting(x, y, owner)) {
			iframe--;
		}
	} else {
		iframe--;
	}
}
existance--;
if (ignorePlayerFrames > 0) {
	ignorePlayerFrames--;
}
if (existance <= 0) {
	instance_destroy();
}
if (instance_exists(owner) && rotate && !canHome) {
	orbitAngle += 2; 
	var targetX = orbitCenter.x + lengthdir_x(orbitRadius, orbitAngle);
	var targetY = orbitCenter.y + lengthdir_y(orbitRadius, orbitAngle);
	
	x = lerp(x, targetX, orbitCatchUpRate);
    y = lerp(y, targetY, orbitCatchUpRate);
}
if (canExplode && explodeObj != noone) {
	if (explodeTimer > 0) {
		explodeTimer--;
	} else {
		instance_destroy();
	}
}
if (canGrow) {
	image_xscale += growRate;
	image_yscale += growRate;
}
if (canHome && instance_exists(homingTarget) && homeDuration > 0) {
	
	homeDuration--;
	speed = 0;
	var dir = point_direction(x, y, homingTarget.x, homingTarget.y);
	direction  -= clamp(angle_difference(direction, dir), -turnSpeed, turnSpeed)
	
	x += lengthdir_x(homeSpeed, direction);
	y += lengthdir_y(homeSpeed, direction);
	image_angle = direction;
}

if (canFlash) {
	flash += flashRate;
	if (existance < 300) {
		flash += flashRate;
	}
	if (flash >= 1 || flash < 0) {
		
		flashRate *= -1;
	}
} else {
	flash = 0;
}
if (canAccel) {
	currentSpeed += accelRate;
	if (canHome) {
		homeSpeed += accelRate;
	}
}
if (canDecel) {
	if (decelLockedToZero && speed > 0) {
		currentSpeed -= decelRate;
	} else if (!decelLockedToZero)  {
		currentSpeed -= decelRate;
	}
}

var finalSpeed = currentSpeed;

if (place_meeting(x, y, oCricleOfFate)) {
	//show_debug_message("Bullet in circle");
	finalSpeed *= 0.1;
}
if (isGhost && isGhosting) {
    finalSpeed *= 0.6;
} 
if (homeDuration <= 0)
speed = finalSpeed;

isGhosting = false;
//inCircle = false;
//currentSpeed = baseSpeed;
if (oItemManager.hasPropheticRune) {
	var playerDist = point_distance(x, y, oTruePlayer.x, oTruePlayer.y);
	if (playerDist < 40 && oPlayerManager.iframes == 0) {
		oPlayerManager.deltaItemBuff += 4;
		audio_play_sound_at(aSniper, x, y, 0, 1, 1, 1, false, 0, global.sfxAudio)
	}
	
}