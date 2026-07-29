existence--;
if (existence <= 10) {
	image_xscale -= 0.1;
	image_yscale -= 0.1;
}
if (existence <= 0) {
	instance_destroy();
}