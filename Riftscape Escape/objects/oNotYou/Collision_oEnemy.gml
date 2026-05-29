if (oItemManager.hasLostCrown) {
	damage = 0.65;
	sizeMax = 6.5;
}
if (other.lastDamagedBy != id) {
	other.lastDamagedBy = id;
	addDamageNumber(other.x, other.y, damage);
	other.enemey_hp -= damage;
	other.flash = 0.5;
}
if (other.enemey_hp <= 0) {
	if (oItemManager.hasHauntedGravestone) {
		var overkill = other.enemey_hp - damage;
		var ghost = instance_create_layer(x, y, "Instances", oGravestoneGhost);
		if (oItemManager.hasLostCrown) {
			ghost.damage += overkill*1.5;
		} else {
			ghost.damage += overkill*1.1;
		}
	}
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