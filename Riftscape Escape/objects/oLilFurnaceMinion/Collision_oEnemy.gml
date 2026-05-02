if (target == other.id) {
	other.enemey_hp -= 2.5;
	other.flash = 1;
	if (other.enemey_hp <= 0) {
		instance_destroy(other);
	}
	instance_destroy();
}