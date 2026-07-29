event_inherited();
if (!active) exit;
if (cooldown > 0) {
	cooldown--;
	if (cooldown == 12) {
		flash = 1;
	}
} else {
	image_angle = dir-90;
	if (global.difficulty == 1) {
		dir += 0.5;
	} else if (global.difficulty == 2) {
		dir += 1.25;
	} else if (global.difficulty >= 3) {
		dir += 1.75;
	} 
	
	if (oPlayerManager.hasTrapRune) {
		dir += 0.75;
	}
	fireTurretFireLine(dir);
}