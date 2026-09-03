
if (instance_exists(oTruePlayer) && oTruePlayer.currentSpeed > 0) {
	existance --;
	inactiveDelay--;
}

if (inactiveDelay <= 0) {
	image_blend = c_white;
} else {
	image_blend = merge_color(c_maroon, c_white, 1 - (inactiveDelay / fadeTime));
}
if (existance < 50) {
	image_alpha -= 0.02;
}
if (existance <= 0) {
	instance_destroy();
}
