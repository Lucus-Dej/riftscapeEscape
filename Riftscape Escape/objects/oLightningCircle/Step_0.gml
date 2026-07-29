existence--;
if (existence <= 30) {
	flash += 0.04;
}
if (existence <= 0) {
	instance_destroy();
}
