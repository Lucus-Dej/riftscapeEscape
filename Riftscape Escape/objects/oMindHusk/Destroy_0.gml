
if (oPlayerManager.hasEssenceHusk && instance_exists(oHuskHealingCircle)) {
	instance_destroy(oHuskHealingCircle)
}
if (oPlayerManager.hasLifeHusk) {
	show_debug_message("THE LIFE HUSK IS ACTIVE")
	instance_create_layer(tpSpotX, tpSpotY, "Instances", oHuskLife)
}
if (doRefund) {
	oPlayerManager.huskTotal = (existance/existanceTot)*oPlayerManager.huskMax;
}