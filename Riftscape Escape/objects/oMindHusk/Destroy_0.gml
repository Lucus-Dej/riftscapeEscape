
if (oPlayerManager.hasEssenceHusk && instance_exists(oHuskHealingCircle)) {
	instance_destroy(oHuskHealingCircle)
}
if (oPlayerManager.hasLifeHusk && flagDestroy) {
	instance_create_layer(tpSpotX, tpSpotY, "Instances", oHuskLife)
}