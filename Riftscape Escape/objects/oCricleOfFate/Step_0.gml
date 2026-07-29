if (existance >= 0) {
	existance--;
	if (keyboard_check(ord(oPlayerManager.circleKey)) && existance < existanceTot*0.9) {
		doRefund = true;
		instance_destroy();
	}
}
if (!place_meeting(x, y, oTruePlayer)) {
	playerLeftCircle = true;
}
image_alpha = 0.1 + existance/(existanceTot);
if (!doRefund) oPlayerManager.circleTotal = 0;
if (existance <= 0) {
	playerOnCircle = false;
	instance_destroy();
}
