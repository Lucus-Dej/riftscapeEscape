if (active) {
	activeDuration--
	image_index = 1;
} else {
	image_index = 0;
}
if (activeDuration <= 0) {
	active = false;
	activeDuration = 300;
}