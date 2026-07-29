event_inherited();
cooldown = 90;
if (global.difficulty == 1) {
	cooldown = 180
} else if (global.difficulty >= 3) {
	cooldown = 60;
} 
delay = cooldown;
type = TURRET_TYPE.NULL;
dir = 0;
lineLength = 640;
lineSpacing = 16;
damage = 16;
lineInterval = 1;
image_angle = dir-90;