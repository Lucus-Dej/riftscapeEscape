event_inherited();
if (!active) exit;
if (cooldown > 0) {
	cooldown--;
	if (cooldown == 12) {
		image_angle += 45;
		flash = 1;
	}
	if (oPlayerManager.hasTrapRune) {
		cooldown--;
	}
} else {
		for (var i = 0; i < 4; i++) {
			var dir = 90*i+image_angle;
			if (i == 0) {
				bulletFire(x, y, dir, 8, 15, oBadBullet, id);
			} else {
				bulletFire(x, y, dir, 8, 15, oBadBullet, id, true);
			}
			
		}
		cooldown = delay;
	
}
