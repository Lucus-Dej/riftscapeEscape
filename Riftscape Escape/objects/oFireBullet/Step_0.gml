event_inherited();
if (!infExist && existance > 0) {
	existance--;
}
if (existance <= 0) {
	instance_destroy(self)
}
if (accel && speed > 0) {
	speed -= 0.03;
}
