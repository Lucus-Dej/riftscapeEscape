event_inherited();
cooldown = 180;
delay = 360;
type = TURRET_TYPE.NULL;
elemType = "null";
warning = instance_create_layer(x, y, "Instances", oTurretDOT, {elementType: "null"})
warning.inf = true;
warning.host = id;
warning.image_xscale = 6;
warning.image_yscale = 6;