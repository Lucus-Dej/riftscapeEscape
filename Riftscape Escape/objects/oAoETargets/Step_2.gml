if (variable_instance_exists(self, "fatedCircle")) {
    if (fatedCircle && !inCircle) {
        speed = baseSpeed;
        fatedCircle = false;
    }
}
if (variable_instance_exists(self, "inCircle") && variable_instance_exists(self, "currentSpeed")  ) {
    if (inCircle) {
        //inCircle = false;
    }
}
if (variable_instance_exists(self, "enemSpeed") && variable_instance_exists(self, "fatedCircle")) {
	if (fatedCircle && !inCircle) {
       path_speed = baseSpeed;
       fatedCircle = false;
    }
}
if (variable_instance_exists(self, "grassedBomb")) {
    if (fatedCircle && !inCircle) {
        speed = baseSpeed;
        fatedCircle = false;
    }
}
if (variable_instance_exists(self, "enemSpeed") && variable_instance_exists(self, "grassedBomb")) {
	if (grassedBomb && !inBombGrass) {
       path_speed = baseSpeed;
       grassedBomb = false;
    }
}
if (variable_instance_exists(self, "targetResetTime")) {
	if (self.targetResetTime > 0) {
		self.targetResetTime--
	}
	if (self.targetResetTime <= 0) {
		self.lastDamagedBy = noone;
	}
}