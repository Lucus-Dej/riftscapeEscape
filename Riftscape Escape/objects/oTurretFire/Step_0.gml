event_inherited();
if (!active) exit;
if (cooldown > 0) {
	cooldown--;
	if (cooldown == 12) {
		flash = 1;
	}
} else {
	dir += 1.25;
	fireTurretFireLine(dir);
}