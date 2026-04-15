if (oPlayerManager.hasRealityHusk) {
	oPlayerManager.realityHuskSpeedBonus = 10;
}
if (doRefund) {
	oPlayerManager.huskTotal = (existance/existanceTot)*oPlayerManager.huskMax;
}
if (oPlayerManager.hasEssenceHusk && instance_exists(oHuskHealingCircle)) {
	instance_destroy(oHuskHealingCircle)
}