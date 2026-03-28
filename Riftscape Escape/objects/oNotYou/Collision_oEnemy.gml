if (other.lastDamagedBy != id) {
	other.lastDamagedBy = id;
	other.enemey_hp -= global.playerDamage/16;
	other.flash = 1;
}
if (other.enemey_hp <= 0) {
	if (image_xscale < 2.5) {
	image_xscale *=1.1;
	image_yscale *=1.1;
	}
	global.playerKilled = true;
	instance_destroy(other);
}