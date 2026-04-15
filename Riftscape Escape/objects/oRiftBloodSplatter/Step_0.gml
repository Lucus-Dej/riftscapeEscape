image_alpha -= decayRate;

if (image_alpha <= 0) {
	instance_destroy()
}