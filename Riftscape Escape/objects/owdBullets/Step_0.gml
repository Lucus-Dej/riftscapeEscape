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
	angularSpeed += 0.1;
	if (instance_exists(oWastelandDestroyer)) {
		phaseBonus = (oWastelandDestroyer.phase+1)/10
	}
    var spinFalloff = 1 / (1 + (ring * 0.8-(phaseBonus)));
	dir += spinDir * angularSpeed * spinFalloff;

    ringSpeed += ringAccel;
	ringSpeed = max(0, ringSpeed);
	ring+= ringSpeed;

    x = owner.x + lengthdir_x(ring, dir);
    y = owner.y + lengthdir_y(ring, dir);
	if (existance < 800) {
		angularSpeed += 0.35;
	}
	
}
if (existance <= 360 && type == 2) {
	orbitRadius += 6;
}
if (existance <= 260 && type == 2) {
	if (orbitRadius <= 0) {
		instance_destroy()
	}
	orbitRadius -= 10;
}
