event_inherited();
if (!active) exit;
if (cooldown > 0) {
	cooldown--;
	if (cooldown == 12) {
		flash = 1;
	}
} else {
	if (instance_exists(target)) {
		var f = instance_create_layer(x, y, "Instances", oBlackHoleTurret)
		f.host = id;
		f.image_xscale = 2;
		f.image_yscale = 2;
		cooldown = delay;
	}
	
}