other.inCircle = true;

if (!variable_instance_exists(other, "fatedCircle")) {
	other.fatedCircle = true;
	other.baseSpeed = other.speed;
    other.speed *= 0.10;
}