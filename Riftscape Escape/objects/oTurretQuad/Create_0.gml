event_inherited();
cooldown = 240;
if (global.difficulty == 1) {
	cooldown = 360
} else if (global.difficulty >= 3) {
	cooldown = 180;
} 
delay = cooldown;
type = TURRET_TYPE.NULL;