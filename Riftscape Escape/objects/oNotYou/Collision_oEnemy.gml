if (other.lastDamagedBy != id) {
	other.lastDamagedBy = id;
	other.enemey_hp -= global.playerDamage/10;
	other.flash = 1;
}
if (other.enemey_hp <= 0) {
	image_xscale *=1.1;
	image_yscale *=1.1;
	global.playerKilled = true;
	instance_destroy(other);
}