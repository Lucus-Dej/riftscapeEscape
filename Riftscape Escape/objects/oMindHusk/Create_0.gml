event_inherited()
portalDelay = 60;
ready = false;
flagDestroy = false;
bulletDelay = 0;
bulletCooldown = bulletDelay;
target = noone;
existance = 900;
existanceTot = existance;
doRefund = false;
tpSpotX = 0; 
tpSpotY = 0;
if (oPlayerManager.hasEssenceHusk) {
	instance_create_layer(x, y, "Instances", oHuskHealingCircle)
}