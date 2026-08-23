if (fade && global.inCombat) {
	faded = true;
	image_alpha = 0.3;
} else if (fade) {
	image_alpha = 0.5;
	faded = true;
}