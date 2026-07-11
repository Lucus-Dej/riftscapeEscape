if (iframe >= 0) {
	iframe--;
}
existance--;
if (existance <= 0) {
	instance_destroy();
}
if (instance_exists(owner) &&rotate) {
	orbitAngle += 2; 
	x = orbitCenter.x + lengthdir_x(orbitRadius, orbitAngle);
	y = orbitCenter.y + lengthdir_y(orbitRadius, orbitAngle);
}



if (canAccel) {
	currentSpeed += 0.2;
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

speed = finalSpeed;

isGhosting = false;
//inCircle = false;
//currentSpeed = baseSpeed;
if (oItemManager.hasPropheticRune) {
	var playerDist = point_distance(x, y, oTruePlayer.x, oTruePlayer.y);
	if (playerDist < 40) {
		oPlayerManager.deltaItemBuff += 4;
		audio_play_sound_at(aSniper, x, y, 0, 1, 1, 1, false, 0, global.sfxAudio)
	}
	
}