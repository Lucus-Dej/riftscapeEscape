with oUpgradeTokenReal {
	if (valid && selected) {
		other.upgrader = id;
		other.startUpgrade = true;
		other.storedUpgrade = upgrade;
	} 
}




if (startUpgrade && upgrader.valid = true) {
switch (abilityID) {
	case 0:
	break; 
	
	// checking if circle needs to be upgraded
	case 1:
	switch (storedUpgrade) {
		//executing all upgrades for circle
		case 0:
		break;
		
		case 1:
		break;
		
		case 2:
		oPlayerManager.hasCircleLife = true;
		oPlayerManager.lifeTokenSpent = true;
		upgradeCount++;
		break;
		
		case 3:
		oPlayerManager.hasCircleReality = true;
		oPlayerManager.realityTokenSpent = true;
		upgradeCount++;
		break;
		
		case 4:
		oPlayerManager.hasCircleThought = true;
		oPlayerManager.thoughtTokenSpent = true;
		upgradeCount++;
		break;
		
		case 5:
		oPlayerManager.hasCircleTime = true;
		oPlayerManager.timeTokenSpent = true;
		upgradeCount++;
		break;
		
		case 6:
		oPlayerManager.hasCircleEssence = true;
		oPlayerManager.essenceTokenSpent = true;
		upgradeCount++;
		break;
	}
	break;
	case 2:
	switch (storedUpgrade) {
		//executing all upgrades for minion
		case 0:
		break;
		
		case 1:
		oPlayerManager.hasMinionFate = true;
		oPlayerManager.fateTokenSpent = true;
		upgradeCount++;
		break;
		
		case 2:
		break;
		
		case 3:
		oPlayerManager.hasMinionReality = true;
		oPlayerManager.realityTokenSpent = true;
		upgradeCount++;
		break;
		
		case 4:
		oPlayerManager.hasMinionThought = true;
		oPlayerManager.thoughtTokenSpent = true;
		upgradeCount++;
		break;
		
		case 5:
		oPlayerManager.hasMinionTime = true;
		oPlayerManager.timeTokenSpent = true;
		upgradeCount++;
		break;
		
		case 6:
		oPlayerManager.hasMinionEssence = true;
		oPlayerManager.essenceTokenSpent = true;
		upgradeCount++;
		break;
	}
	break;
	case 3:
	switch (storedUpgrade) {
		case 1:
		oPlayerManager.hasDodgeFate = true;
		oPlayerManager.fateTokenSpent = true;
		upgradeCount++;
		break;
		
		case 2:
		oPlayerManager.hasDodgeLife = true;
		oPlayerManager.lifeTokenSpent = true;
		upgradeCount++;
		break;
		
		case 3:
		break;
		
		case 4:
		oPlayerManager.hasDodgeThought = true;
		oPlayerManager.thoughtTokenSpent = true;
		upgradeCount++;
		break;
		
		case 5:
		oPlayerManager.hasDodgeTime = true;
		oPlayerManager.timeTokenSpent = true;
		upgradeCount++;
		break;
		
		case 6:
		oPlayerManager.hasDodgeEssence = true;
		oPlayerManager.essenceTokenSpent = true;
		upgradeCount++;
		break;
	}
	break;
	case 4:
	switch (storedUpgrade) {
		case 1:
		oPlayerManager.hasFateHusk = true;
		oPlayerManager.fateTokenSpent = true;
		upgradeCount++;
		break;
		
		case 2:
		oPlayerManager.hasLifeHusk = true;
		oPlayerManager.lifeTokenSpent = true;
		upgradeCount++;
		break;
		
		case 3:
		oPlayerManager.hasRealityHusk = true;
		oPlayerManager.realityTokenSpent = true;
		upgradeCount++;
		break;
		
		case 4:
		break;
		
		case 5:
		oPlayerManager.hasTimeHusk = true;
		oPlayerManager.timeTokenSpent = true;
		upgradeCount++;
		break;
		
		case 6:
		oPlayerManager.hasEssenceHusk = true;
		oPlayerManager.essenceTokenSpent = true;
		upgradeCount++;
		break;
	}
	break;
	case 5:
	switch (storedUpgrade) {
		case 1:
		oPlayerManager.hasCrystalFate = true;
		oPlayerManager.fateTokenSpent = true;
		upgradeCount++;
		break;
		
		case 2:
		oPlayerManager.hasCrystalLife = true;
		oPlayerManager.lifeTokenSpent = true;
		upgradeCount++;
		break;
		
		case 3:
		oPlayerManager.hasCrystalReality = true;
		oPlayerManager.realityTokenSpent = true;
		upgradeCount++;
		break;
		
		case 4:
		oPlayerManager.hasCrystalThought = true;
		oPlayerManager.thoughtTokenSpent = true;
		upgradeCount++;
		break;
		
		case 5:
		break;
		
		case 6:
		oPlayerManager.hasCrystalEssence = true;
		oPlayerManager.essenceTokenSpent = true;
		upgradeCount++;
		break;
	}
	break;
	case 6:
	switch (storedUpgrade) {
		case 1:
		oPlayerManager.hasSwordFate = true;
		oPlayerManager.fateTokenSpent = true;
		upgradeCount++;
		break;
		
		case 2:
		oPlayerManager.hasSwordLife = true;
		oPlayerManager.lifeTokenSpent = true;
		upgradeCount++;
		break;
		
		case 3:
		oPlayerManager.hasSwordReality = true;
		oPlayerManager.realityTokenSpent = true;
		upgradeCount++;
		break;
		
		case 4:
		oPlayerManager.hasSwordThought = true;
		oPlayerManager.thoughtTokenSpent = true;
		upgradeCount++;
		break;
		
		case 5:
		oPlayerManager.hasSwordTime = true;
		oPlayerManager.timeTokenSpent = true;
		upgradeCount++;
		break;
		
		case 6:
		break;
	}
	break;
}

with oUpgradeTokenStaticoUpgradeTokenStatic {
	if (other.abilityID == ownerID && other.upgradeCount == upgradeID) {
		image_index = other.upgrader.upgradeID;
	}
}

startUpgrade = false;
upgrader.valid = false;
upgrader.selected = false;
upgrader.upgradeSpent = true;
storedUpgrade = 0;
}
	
	
	
	
	
	/*
switch (abilityID) {
	if (oPlayerManager.initMinion) {
		image_index = 3
		abilityGained = 2
	} else {
		image_index = 2
	}
	break;
	case 3:
	if (oPlayerManager.initDodge) {
		image_index = 5
		abilityGained = 3
	} else {
		image_index = 4
	}
	break;
	case 4:
	if (oPlayerManager.initHusk) {
		image_index = 7
		abilityGained = 4
	} else {
		image_index = 6
	}
	break;
	case 5:
	if (oPlayerManager.initCrystal) {
		image_index = 9
		abilityGained = 5
	} else {
		image_index = 8
	}
	break;
	case 6:
	if (oPlayerManager.initate_sword) {
		image_index = 11
		abilityGained = 6
	} else {
		image_index = 10
	}
	break;
}
*/