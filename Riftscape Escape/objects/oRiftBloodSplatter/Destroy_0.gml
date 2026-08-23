if (canHeal) {
	if (oPlayerManager.hasSifterRune) {
		sifterRuneAbilityUpdate();
	}
	var heal = global.lifesteal*9*image_xscale*0.8;
	healPlayer(heal, true);
	if (oPlayerManager.inOverhealth && oPlayerManager.overhealthTimer < 100+20*global.playerEssence) {
			oPlayerManager.overhealthTimer += 45+global.playerEssence*5;
	}
	if (oPlayerManager.overHealthOverheated) {
		oPlayerManager.overhealthSuperTimer -= 10*global.playerEssence+45;
	}
	if (oItemManager.hasVeribroseEssence) {
		oPlayerManager.trueCrit = true;
	}
	if (oItemManager.hasKrostEssence) {
		if (oPlayerManager.krostEssenceSpeedBouns <= 2) {
			oPlayerManager.krostEssenceSpeedBouns += 0.45;
		}
		
	}
}