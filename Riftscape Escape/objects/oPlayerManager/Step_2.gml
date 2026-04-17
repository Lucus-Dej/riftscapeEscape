if (global.playerKilled == true) {
	if (inOverhealth && overhealthTimer < 125+25*global.playerEssence) {
		overhealthTimer += 25+global.playerEssence*5;
	}
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
	
	if (oItemManager.hasActionFigure) {
	instance_create_layer(oPlayerManager.lastKilledX, oPlayerManager.lastKilledY, "Instances", oActionFigureAttack)
	}
	if (oItemManager.hasSmallSculpture) {
		oItemManager.sculptureTimer = 300;
		sculptureBonus = 1.25;
	}
	global.playerKilled = false;
}