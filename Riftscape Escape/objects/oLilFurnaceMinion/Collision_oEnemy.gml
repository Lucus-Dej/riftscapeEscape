if (target == other.id) {
	other.enemey_hp -= damage;
	other.flash = 1;
	if (other.enemey_hp <= 0) {
		instance_destroy(other);
	}
	instance_destroy();
}