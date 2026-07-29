event_inherited();
cooldown = 120;
if (global.difficulty == 1) {
	cooldown = 240
} else if (global.difficulty >= 3) {
	cooldown = 80;
} 
delay = cooldown;
type = TURRET_TYPE.NULL;
image_angle = 90;