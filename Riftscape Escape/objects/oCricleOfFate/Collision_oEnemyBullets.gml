other.inCircle = true;

if (!variable_instance_exists(other, "fatedCircle")) {
	other.fatedCircle = true;
	other.base_speed = other.speed;
    other.speed *= 0.10;
}