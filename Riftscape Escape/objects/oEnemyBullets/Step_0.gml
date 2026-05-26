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
	currentSpeed -= decelRate;
}

if (isGhost && isGhosting) {
    speed = currentSpeed * 0.6;
} else {
	speed = currentSpeed;
}
isGhosting = false;
