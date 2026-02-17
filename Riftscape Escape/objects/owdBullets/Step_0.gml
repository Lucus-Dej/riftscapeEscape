event_inherited();
if (!instance_exists(owner)) {
    instance_destroy();
    exit;
}

if (!infExist && existance > 0) {
	existance--;
}
if (existance <= 0) {
	instance_destroy()
}
if (accel && speed > 0) {
	speed -= 0.03;
}
if (type == 1) {
	angularSpeed += 0.02;
    var spinFalloff = 1 / (1 + (ring * 0.01));
	dir += spinDir * angularSpeed * spinFalloff;

    ringSpeed += ringAccel;
	ringSpeed = max(0, ringSpeed);
	ring+= ringSpeed;

    x = owner.x + lengthdir_x(ring, dir);
    y = owner.y + lengthdir_y(ring, dir);
	
}
if (existance <= 360 && type == 2) {
	orbitRadius += 8;
}
if (existance <= 260 && type == 2) {
	orbitRadius -= 12;
}