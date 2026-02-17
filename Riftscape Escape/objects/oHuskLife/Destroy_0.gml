if (oPlayerManager.hasRealityHusk) {
	oPlayerManager.realityHuskSpeedBonus = 10;
}
if (oPlayerManager.hasEssenceHusk && instance_exists(oHuskHealingCircle)) {
	instance_destroy(oHuskHealingCircle)
}