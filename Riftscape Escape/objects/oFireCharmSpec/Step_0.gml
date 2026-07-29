if (existence > 0) {
	existence--;
	if (speed > 0) {
		speed -= 0.01;
	}
	if (existence <= 10) {
		image_xscale -= 0.1;
		image_yscale -= 0.1;
	}
} else {
	instance_destroy()
}
if (place_meeting(x, y, oSuperwalls)) {
	speed = 0;
}