event_inherited();
cooldown = 180;
if (global.difficulty == 1) {
	cooldown = 320;
} else if (global.difficulty >= 3) {
	cooldown = 120;
} 
delay = cooldown;
type = TURRET_TYPE.NULL;
dir = 0;
lineLength = 640;
lineSpacing = 12;
damage = 20;
lineInterval = 1;
image_angle = targetDir;
checker = instance_create_layer(x, y, "Instances", oArrowTurretBoundary);
checker.image_angle = targetDir;
extensionLimit = lengthDist;
extensionCheck = 0;
with (checker) {
	while (!place_meeting(x, y, oBulletBlocker) && other.extensionCheck < other.extensionLimit) {
		image_yscale+= 1;
		other.extensionCheck++;
	}
}
//checker.image_yscale = lengthDist;
checker.image_alpha = 0.2;
checker.host = id;
fire = false;
//checker.x += lengthdir_x(lengthDist / 2, targetDir + 90);
//checker.y += lengthdir_y(lengthDist / 2, targetDir + 90);