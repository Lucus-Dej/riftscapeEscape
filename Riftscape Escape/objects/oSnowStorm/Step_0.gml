if (existence > 0) {
	existence--;
	if (existence <= 10) {
		image_xscale -= 0.1;
		image_yscale -= 0.1;
	}
	if (image_alpha < 1) {
		image_alpha += 0.05;
	}
} else {
	instance_destroy()
}

