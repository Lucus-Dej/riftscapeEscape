other.inCircle = true;
if (!variable_instance_exists(other, "fatedCircle") && variable_instance_exists(other, "enemSpeed")) {
	other.bass_enemSpeed = other.path_speed;
	other.path_speed *= 0.5;
}