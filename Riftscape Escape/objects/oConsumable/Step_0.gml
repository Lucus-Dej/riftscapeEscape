if (idleTime > 0) {
	idleTime--;
}
//existenceTime--;
image_alpha = (existenceTime/maxExistTime);
if (existenceTime <= 0) {
	instance_destroy();
}
if (displayDesc) {
	displayItemFunction(object_index);
}