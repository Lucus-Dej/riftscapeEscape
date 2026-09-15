function rifterKingCheckAbilities(){
	if (!global.meta.challenges.gotItemDictionary) {
		if (global.playerLife == 1 && global.playerFate == 1 && 
			global.playerThought == 1 && global.playerTime == 1 && 
			global.playerReality== 1 && global.playerEssence == 1) {
				showChallenge("gotItemDictionary");
				global.meta.challenges.gotItemDictionary = true;
			}
	}
	if (!global.meta.challenges.gotItemPathForward) {
		var highestRarity = -1;
		for (var i = 0; i < array_length(oItemManager.itemList); i++) {
			var itm = oItemManager.itemList[i];
			var r = findItemRarity(itm)
			if (r > highestRarity) {
				r = highestRarity;
			}
		}
		if (highestRarity <= 0) {
			showChallenge("gotItemPathForward")
			global.meta.challenges.gotItemPathForward = true;
		}
	}
	
	with (oPlayerManager) {
		var abilArray =  [initate_sword, initDodge, initCrystal, initCircle, initHusk, initMinion];
		if (initCircle) {
			if (hasCircleEssence && hasCircleLife && hasCircleReality && hasCircleThought && hasCircleTime) {
				global.meta.challenges.beatKingWithFullCircle = true;
				showChallenge("beatKingWithFullCircle")
			}
		}
		
		if (initMinion) {
			if (hasMinionEssence && hasMinionFate && hasMinionReality && hasMinionThought && hasMinionTime) {
				global.meta.challenges.beatKingWithFullMinion = true;
				showChallenge("beatKingWithFullMinion")
			}
		}
		
		if (initDodge) {
			if (hasDodgeEssence && hasDodgeLife && hasDodgeFate && hasDodgeThought && hasDodgeTime) {
				global.meta.challenges.beatKingWithFullDodge = true;
				showChallenge("beatKingWithFullDodge")
			}
		}
		
		if (initCrystal) {
			if (hasCrystalEssence && hasCrystalFate && hasCrystalLife && hasCrystalThought && hasCrystalReality) {
				global.meta.challenges.beatKingWithFullBomb = true;
				showChallenge("beatKingWithFullBomb")
			}
		}
		
		if (initHusk) {
			if (hasLifeHusk && hasTimeHusk && hasRealityHusk && hasTimeHusk && hasFateHusk) {
				global.meta.challenges.beatKingWithFullHusk = true;
				showChallenge("beatKingWithFullHusk")
			}
		}
		
		if (initate_sword) {
			if (hasSwordFate && hasSwordLife && hasSwordReality && hasSwordThought && hasSwordTime) {
				global.meta.challenges.beatKingWithFullSword = true;
				showChallenge("beatKingWithFullSword")
			}
		}
		
		
	}
}