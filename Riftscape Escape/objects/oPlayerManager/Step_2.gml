if (global.playerKilled == true) {
	if (hasCircleEssence && initCircle && oTruePlayer.inCircle) {
		oCricleOfFate.existance += global.playerEssence*30;
	}
	if (instance_exists(oMinionEssence)) {
		with oMinionEssence {
			existance += 24;
		}
	}
	if (hasMinionEssence && instance_exists(oMinion) && essenceMinionCount < global.playerEssence) {
			instance_create_layer(oTruePlayer.x, oTruePlayer.y, "Instances", oMinionEssence)
	}
	if (trackDodgeThoughtTimer > 0) {
		thoughtDodgeCooldownBoost = 10;
	}
	if (oItemManager.hasActionFigure) {
	instance_create_layer(oPlayerManager.lastKilledX, oPlayerManager.lastKilledY, "Instances", oActionFigureAttack)
	}
	if (inOverhealth) {
		overhealthTimer = 110+global.playerEssence*10;
	}
	if (oItemManager.hasSmallSculpture) {
		oItemManager.sculptureTimer = 300;
		sculptureBonus = 1.25;
	}
	global.playerKilled = false;
}