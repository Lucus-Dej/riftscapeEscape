portalDelay = 60;
ready = false;
flagDestroy = false;
bulletDelay = 0;
bulletCooldown = bulletDelay;
target = noone;
existance = 900;
if (oPlayerManager.hasTimeHusk) {
	existance = 450;
}
if (oPlayerManager.hasEssenceHusk) {
	instance_create_layer(x, y, "Instances", oHuskHealingCircle)
}