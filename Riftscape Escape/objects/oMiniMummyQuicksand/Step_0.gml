
existance--;
if (existance <= 0) {
	instance_destroy();
}

if (existance <= existanceTotal*0.5 && image_xscale > 0) {
	image_yscale -= 0.05;
	image_xscale -= 0.06;
} else {
	image_yscale += 0.02;
	image_xscale += 0.02;
}
