other.inBombGrass = true;
if (!variable_instance_exists(other, "grassedBomb") && variable_instance_exists(other, "enemSpeed")) {
	other.base_enemSpeed = other.path_speed;
	other.path_speed *= slow;
}