if (variable_instance_exists(self, "fatedCircle")) {
    if (fatedCircle && !inCircle) {
        speed = base_speed;
        fatedCircle = false;
    }
}
if (variable_instance_exists(self, "enemSpeed") && variable_instance_exists(self, "fatedCircle")) {
	if (fatedCircle && !inCircle) {
       path_speed = base_speed;
       fatedCircle = false;
    }
}
if (variable_instance_exists(self, "grassedBomb")) {
    if (fatedCircle && !inCircle) {
        speed = base_speed;
        fatedCircle = false;
    }
}
if (variable_instance_exists(self, "enemSpeed") && variable_instance_exists(self, "grassedBomb")) {
	if (grassedBomb && !inBombGrass) {
       path_speed = base_speed;
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