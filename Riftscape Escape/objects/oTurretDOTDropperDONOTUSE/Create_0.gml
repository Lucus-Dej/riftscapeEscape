event_inherited();
cooldown = 180;
if (global.difficulty == 1) {
	cooldown = 240
} else if (global.difficulty >= 3) {
	cooldown = 120;
} 
delay = 360;
type = TURRET_TYPE.NULL;
elemType = "null";
warning = instance_create_layer(x, y, "Instances", oTurretDOT, {elementType: "null"})
warning.inf = true;
warning.host = id;
warning.image_xscale = 8;
warning.image_yscale = 8;