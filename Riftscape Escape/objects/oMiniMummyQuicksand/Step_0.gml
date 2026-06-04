
existance--;
if (existance <= 0) {
	instance_destroy();
}

if (existance <= 60 && image_xscale > 0) {
	image_yscale -= 0.04;
	image_xscale -= 0.04;
} else {
	image_yscale += 0.01;
	image_xscale += 0.01;
}
