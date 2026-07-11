event_inherited();
if (!active) exit;
var dir = point_direction(x, y, target.x, target.y);
image_angle = dir-90;
if (cooldown > 0) {
	cooldown--;
	if (cooldown == 12) {
		flash = 1;
	}
} else {
	if (instance_exists(target) && canSeePlayer) {
		var f = bulletFire(x, y, dir+40, 8, 25, oBadBullet, id);
		var t = bulletFire(x, y, dir-40, 8, 25, oBadBullet, id);
		cooldown = delay;
	}
	
}