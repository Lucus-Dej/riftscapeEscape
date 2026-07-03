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

if (isGhost && isGhosting) {
    speed = currentSpeed * 0.6;
} else {
	speed = currentSpeed;
}
isGhosting = false;
if (oItemManager.hasPropheticRune) {
	var playerDist = point_distance(x, y, oTruePlayer.x, oTruePlayer.y);
	if (playerDist < 40) {
		oPlayerManager.deltaItemBuff += 4;
		audio_play_sound_at(aSniper, x, y, 0, 1, 1, 1, false, 0, global.sfxAudio)
	}
	
}