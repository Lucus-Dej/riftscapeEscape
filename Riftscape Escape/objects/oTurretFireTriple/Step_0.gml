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
	image_angle = dir-90;
	if (oPlayerManager.hasTrapRune) {
		dir += 0.6;
	}
	if (global.difficulty == 1) {
		dir += 0.3;
	} else if (global.difficulty == 2) {
		dir += 0.6;
	} else if (global.difficulty >= 3) {
		dir += 1.2;
	}
	fireTurretFireLine(dir, 96);
	fireTurretFireLine(dir+120, 96);
	fireTurretFireLine(dir+240, 96);
}