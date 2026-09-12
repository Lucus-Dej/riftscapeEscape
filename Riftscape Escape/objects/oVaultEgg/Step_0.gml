existence--;
if (existence <= 0) {
	if (!instance_exists(bank))
	bank =instance_create_layer(x, y, "Items", oXPVault);
	image_alpha -= 0.02;
	if (image_alpha <= 0.1) {
		instance_destroy();
	}
} else {
	if (image_alpha < 1) {
		image_alpha += 0.05;
	}
}