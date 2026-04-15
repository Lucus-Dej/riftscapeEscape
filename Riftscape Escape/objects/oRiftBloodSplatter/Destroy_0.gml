if (canHeal) {
	global.player_health += global.lifesteal*8.5*image_xscale;
	if (oPlayerManager.inOverhealth && oPlayerManager.overhealthTimer < 125+25*global.playerEssence) {
			oPlayerManager.overhealthTimer += 40+global.playerEssence*5;
	}
	if (oPlayerManager.overHealthOverheated) {
		oPlayerManager.overhealthSuperTimer -= 15*global.playerEssence+45;
	}
}