event_inherited();
if (!active) exit;
if (cooldown > 0) {
	if (!instance_exists(rocket)) {
		cooldown--;
		if (oPlayerManager.hasTrapRune) {
			cooldown--;
		}
	}
	if (cooldown == 12) {
		flash = 1;
	}
} else {
	if (instance_exists(target) && canSeePlayer) {
		var dir = point_direction(x, y, target.x, target.y);
		rocket = bulletFire(x, y, dir, 4, 25, oBadBullet, id);
		rocket.canFriendlyFireOwner = true;
		rocket.existance = 1200;
		rocket.explodeTimer = 1200;
		rocket.canExplode = true;
		rocket.explodeObj = oExplosiveRuneBoom;
		rocket.homingTarget = target;
		rocket.canFlash = true;
		rocket.canHome = true;
		rocket.turnSpeed = 2;
		rocket.homeSpeed = 4;
		rocket.homeDuration = 1200;
		rocket.sprite_index = sRocket;
		cooldown = delay;
	}
	
}