event_inherited();
if (!active) exit;
if (cooldown > 0) {
	cooldown--;
	if (cooldown == 12) {
		flash = 1;
	}
} else {
	image_angle = dir-90;
	dir += 0.4;
	fireTurretFireLine(dir, 96);
	fireTurretFireLine(dir+90, 96);
	fireTurretFireLine(dir+180, 96);
	fireTurretFireLine(dir+270, 96);
}