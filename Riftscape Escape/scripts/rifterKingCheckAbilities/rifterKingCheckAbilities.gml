function rifterKingCheckAbilities(){
	with (oPlayerManager) {
		var abilArray =  [initate_sword, initDodge, initCrystal, initCircle, initHusk, initMinion];
		if (initCircle) {
			if (hasCircleEssence && hasCircleLife && hasCircleReality && hasCircleThought && hasCircleTime) {
				global.meta.challenges.beatKingWithFullCircle = true;
			}
		}
		
		if (initMinion) {
			if (hasMinionEssence && hasMinionFate && hasMinionReality && hasMinionThought && hasMinionTime) {
				global.meta.challenges.beatKingWithFullMinion = true;
			}
		}
		
		if (initDodge) {
			if (hasDodgeEssence && hasDodgeLife && hasDodgeFate && hasDodgeThought && hasDodgeTime) {
				global.meta.challenges.beatKingWithFullDodge = true;
			}
		}
		
		if (initCrystal) {
			if (hasCrystalEssence && hasCrystalFate && hasCrystalLife && hasCrystalThought && hasCrystalReality) {
				global.meta.challenges.beatKingWithFullBomb = true;
			}
		}
		
		if (initHusk) {
			if (hasLifeHusk && hasTimeHusk && hasRealityHusk && hasTimeHusk && hasFateHusk) {
				global.meta.challenges.beatKingWithFullHusk = true;
			}
		}
		
		if (initate_sword) {
			if (hasSwordFate && hasSwordLife && hasSwordReality && hasSwordThought && hasSwordTime) {
				global.meta.challenges.beatKingWithFullSword = true;
			}
		}
		
		
	}
}