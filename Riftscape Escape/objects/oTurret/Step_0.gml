event_inherited();
if (!active) exit;
if (cooldown > 0) {
	cooldown--;
	if (oPlayerManager.hasTrapRune) {
		cooldown--;
	}
	if (cooldown == 12) {
		flash = 1;
	}
} else {
	if (instance_exists(target) && canSeePlayer) {
		var dir = point_direction(x, y, target.x, target.y);
		var f = bulletFire(x, y, dir, 9, 20, oBadBullet, id);
		cooldown = delay;
	}
	
}