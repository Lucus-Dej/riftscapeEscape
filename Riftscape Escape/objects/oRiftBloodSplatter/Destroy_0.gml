if (canHeal) {
	if (oPlayerManager.hasSifterRune) {
		sifterRuneAbilityUpdate();
	}
	var heal = global.lifesteal*9*image_xscale*0.8;
	healPlayer(heal, true);
	if (oPlayerManager.inOverhealth) {
		if (oPlayerManager.overhealthTimer < 100) {
			oPlayerManager.overhealthTimer += 12+global.playerEssence*0.5;
		} else {
			oPlayerManager.overhealthTimer += 5+global.playerEssence*0.25;
		}	
	} else if (oPlayerManager.overHealthOverheated) {
		oPlayerManager.overhealthSuperTimer -= 5*global.playerEssence+45;
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