event_inherited();
if (global.difficulty == 1) {
	cooldown = 240
} else if (global.difficulty == 2) {
	cooldown = 180;
} else if (global.difficulty >= 3) {
	cooldown = 140;
}
delay = 360;
type = TURRET_TYPE.NULL;