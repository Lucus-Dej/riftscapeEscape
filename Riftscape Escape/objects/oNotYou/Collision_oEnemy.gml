if (oItemManager.hasLostCrown) {
	damage = 0.65;
	sizeMax = 6.5;
}
if (other.lastDamagedBy != id) {
	other.lastDamagedBy = id;
	other.enemey_hp -= damage;
	other.flash = 0.5;
}
if (other.enemey_hp <= 0) {
	if (image_xscale < sizeMax) {
		if (oItemManager.hasLostCrown) {
			image_xscale *=1.35;
			image_yscale *=1.35;
		} else {
			image_xscale *=1.1;
			image_yscale *=1.1;
		}
	
	}
	global.playerKilled = true;
	instance_destroy(other);
}