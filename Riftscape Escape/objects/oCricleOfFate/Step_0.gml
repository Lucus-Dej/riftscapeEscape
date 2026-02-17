if (existance >= 0) {
	existance--;
}
oPlayerManager.circleTotal = 0;
if (existance <= 0) {
	oPlayerManager.circleTotal = 0;
	playerOnCircle = false;
	instance_destroy();
}
