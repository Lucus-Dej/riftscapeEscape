if (global.playerKilled == true) {
	if (inOverhealth && overhealthTimer < 125+25*global.playerEssence) {
		overhealthTimer += 25+global.playerEssence*5;
	}
	if (hasCircleEssence && initCircle && oTruePlayer.inCircle && instance_exists(oCricleOfFate)) {
		oCricleOfFate.existance += global.playerEssence*30;
		if (oCricleOfFate.existance > oCricleOfFate.existanceTot*0.9) {
			oCricleOfFate.existance = oCricleOfFate.existanceTot*0.9
		}
	}
	if (instance_exists(oMinionEssence)) {
		with oMinionEssence {
			existance += 24;
		}
	}
	if (hasMinionEssence && instance_exists(oMinion) && essenceMinionCount < global.playerEssence) {
		if (hasMinionFate) {
			var i = irandom(3);
			if (i == 1) {
				instance_create_layer(oTruePlayer.x, oTruePlayer.y, "Instances", oMinionEssence)
			} else {
				instance_create_layer(oTruePlayer.x, oTruePlayer.y, "Instances", oMinionFateEssence)
			}
		} else {
			instance_create_layer(oTruePlayer.x, oTruePlayer.y, "Instances", oMinionEssence)
		}
		
		
			
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