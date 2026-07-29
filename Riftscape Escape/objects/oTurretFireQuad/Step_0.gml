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
	if (global.difficulty == 1) {
		dir += 0.2;
	} else if (global.difficulty == 2) {
		dir += 0.4;
	} else if (global.difficulty >= 3) {
		dir += 0.8;
	} 
	if (oPlayerManager.hasTrapRune) {
		dir += 0.6;
	}
	fireTurretFireLine(dir, 96);
	fireTurretFireLine(dir+90, 96);
	fireTurretFireLine(dir+180, 96);
	fireTurretFireLine(dir+270, 96);
}