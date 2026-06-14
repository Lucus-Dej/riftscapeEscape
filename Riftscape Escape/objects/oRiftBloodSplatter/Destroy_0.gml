if (canHeal) {
	global.player_health += global.lifesteal*12.5*image_xscale;
	if (oPlayerManager.inOverhealth && oPlayerManager.overhealthTimer < 100+20*global.playerEssence) {
			oPlayerManager.overhealthTimer += 45+global.playerEssence*5;
	}
	if (oPlayerManager.overHealthOverheated) {
		oPlayerManager.overhealthSuperTimer -= 10*global.playerEssence+45;
	}
	if (oItemManager.hasVirstEssence) {
		oPlayerManager.trueCrit = true;
	}
	if (oItemManager.hasKrostEssence) {
		if (oPlayerManager.krostEssenceSpeedBouns <= 2) {
			oPlayerManager.krostEssenceSpeedBouns += 0.45;
		}
		
	}
	if (oPlayerManager.hasDodgeThought && (oPlayerManager.dodgeState = DODGE_PHASE.dodging || oPlayerManager.dodgeState = DODGE_PHASE.blackflashing)) {
	oPlayerManager.thoughtDodgeCooldownBoost += 4.5;
	}
}