event_inherited();
if (!active) exit;
if (cooldown > 0) {
	cooldown--;
	if (cooldown == 12) {
		flash = 1;
	}
	if (oPlayerManager.hasTrapRune) {
		cooldown--;
	}
} else {
	if (instance_exists(target)) {
		var f = instance_create_layer(x, y, "Instances", oTurretDOT, {elementType: elemType})
		f.host = id;
		f.image_xscale = 8;
		f.image_yscale = 8;
		cooldown = delay;
	}
	
}