
existance--;
if (existance <= 0) {
	instance_destroy();
}

if (existance <= 60) {
	image_yscale -= 0.04;
	image_xscale -= 0.04;
} else {
	image_yscale += 0.006;
	image_xscale += 0.006;
}
