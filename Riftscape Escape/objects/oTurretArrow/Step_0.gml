event_inherited();
if (!active) exit;
if (cooldown > 0) {
	if (oPlayerManager.hasTrapRune) {
		cooldown--;
	}
	cooldown--;
	fire = false;
	if (cooldown == 12) {
		flash = 1;
	}
} else {
	var targetX = lengthdir_x(640, targetDir+90);
	var targetY = lengthdir_y(640, targetDir+90);
	checker.image_alpha = 0.4;
	//checker.y = y;
	//checker.x = x;
	if (fire) {
		checker.image_alpha = 0.2;
		cooldown = delay;
		var b = bulletFire(x, y, targetDir+90, 36, 20, oArrowBullet, id);
		b.dotDamage = 2.5;
		b.dotDelay = 12;
		b.dotTarget = oTruePlayer;
		b.dotTicks = 8;
		b.canAccel = true;
		b.image_angle = targetDir;
		b.accelRate = 2.5;
	}
	//fireTurretFireLine(dir);
}