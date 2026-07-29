event_inherited();
cooldown = 180;
if (global.difficulty == 1) {
	cooldown = 320;
} else if (global.difficulty >= 3) {
	cooldown = 120;
} 
delay = cooldown;
type = TURRET_TYPE.NULL;