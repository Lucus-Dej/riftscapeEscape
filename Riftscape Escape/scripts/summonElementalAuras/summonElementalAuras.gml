function summonElementalAuras(){
	if (!instance_exists(oTruePlayer)) {
		return;
	}
	var elemArray = [oElementalAuraPois, oElementalAuraFire, oElementalAuraLightning, oElementalAuraBlood, oElementalAuraIce];
	if (oItemManager.hasFireCharm) {
		array_push(elemArray, oElementalAuraFire);
	}
	if (oItemManager.hasLightningCharm) {
		array_push(elemArray, oElementalAuraLightning);
	}
	if (oItemManager.hasIceCharm) {
		array_push(elemArray, oElementalAuraIce);
	}
	if (oItemManager.hasPoisonCharm) {
		array_push(elemArray, oElementalAuraPois);
	}
	if (oItemManager.hasLightningCharm) {
		array_push(elemArray, oElementalAuraLightning);
	}
	var i = irandom(array_length(elemArray)-1);
	var aura = elemArray[i];
	instance_create_layer(oTruePlayer.x, oTruePlayer.y, "Instances", aura)
	
}