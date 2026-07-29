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
	var f = bulletFire(x, y, 0, 8, 17.5, oBadBullet, id);
	var j = bulletFire(x, y, 180, 8, 17.5, oBadBullet, id, true);
	cooldown = delay;
}