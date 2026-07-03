if (existence > 0) {
	existence--;
	var incRate = existence/exisTotal;
	image_xscale += 0.3*incRate;
	image_yscale += 0.3*incRate;
	image_alpha = incRate;
} else {
	instance_destroy();
}