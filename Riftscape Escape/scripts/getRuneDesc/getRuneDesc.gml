function getRuneDesc(_rune){
	//if (array_contains(oPlayerManager.activeRuneArray, _rune)) {
	//	sprite_index = sNullRune;
	//	return "Dull Rune: No Effect; No Reward";
	//}
	var runeDesc = "";
	switch (_rune) {
		case oItemDenyRune:
		desc = "Denial Rune:  Two Random Rare+ Items Are Disabled At Start Of Room";
		break;
		case oPowerUpRune:
		desc = "Power Up Rune: Power Ups No Longer Spawn";
		break;
		case oVeribroseRune:
		desc = "Verirbose's Rune: Boss Door Is Locked Until Floor Completion. Minimap Is Disabled";
		break;
		case oTorzolRune:
		desc = "Torzol's Rune: Up To 60% Of Health Is Drained Over Time";
		break;
		case oVirstRune:
		desc = "Virst's Rune: All Items Are Random. All Item Pools Are Mixed";
		break;
		case oBossRune:
		desc = "Boss Rune: Chance For Bosses To Spawn In Normal Rooms";
		break;
		case oTrapRune:
		desc = "Trap Rune: Traps Activate Much Quicker";
		break;
		case oKrostRune:
		desc = "Krost's Rune: Movement Speed Is Reduced Inside Combat";
		break;
		case oDullRune:
		desc = "Dull Rune: No Effect; No Reward";
		break;
		case oAlextraRune:
		desc = "Alextra's Rune: Your Vision Is Reduced";
		break;
		case oBossDropRune:
		desc = "Poor Man's Rune: Bosses No Longer Drop Items";
		break;
		case oBulletRangeRune:
		desc = "Decay Rune: Bullet Existance Time Is Halved";
		break;
		case oExplosiveRune:
		desc = "Explosive Rune: Enemies Drop An Explosive On Death";
		break;
		case oLifestealRune:
		desc = "Lifesteal Rune: Bullet Lifesteal Is Disabled";
		break;
		case oLuckRune:
		desc = "Luck Rune: Luck Is Massively Reduced";
		break;
		case oOverhealthRune:
		desc = "Overhealth Rune: Overhealth Is Disabled";
		break;
		case oXPReducedRune:
		desc = "XP Rune: XP Gain Is Halved";
		break;
		case oSifterRune:
		desc = "Sifter's Rune: Ability Charge Drains Over Time. Absorb Rift Puddles To Charge Them";
		break;
	}
	return desc;
}

function enableRune(_rune){
	oItemManager.dustCount++;
	switch (_rune) {
		case oItemDenyRune:
		oPlayerManager.hasItemDenyRune = true;
		break;
		case oPowerUpRune:
		oPlayerManager.hasPowerUpRune = true;
		break;
		case oVeribroseRune:
		oPlayerManager.hasVeribroseRune = true;
		break;
		case oTorzolRune:
		oPlayerManager.hasTorzolRune = true;
		break;
		case oVirstRune:
		oPlayerManager.hasVirstRune = true;
		break;
		case oBossRune:
		oPlayerManager.hasBossRune = true;
		break;
		case oTrapRune:
		oPlayerManager.hasTrapRune = true;
		break;
		case oKrostRune: 
		oPlayerManager.hasKrostRune = true;
		oPlayerManager.krostRuneDebuff = 1.4;
		break;
		case oAlextraRune:
		oPlayerManager.hasAlextraRune = true;
		oLightManager.darkLevel = 1;
		break;
		case oBossDropRune:
		oPlayerManager.hasBossDropRune = true;
		break;
		case oBulletRangeRune:
		oPlayerManager.hasBulletRangeRune = true;
		break;
		case oExplosiveRune:
		oPlayerManager.hasExplosiveRune = true;
		break;
		case oLifestealRune:
		oPlayerManager.hasLifestealRune = true;
		break;
		case oLuckRune:
		oPlayerManager.hasLuckRune = true;
		oItemManager.luckBonus -= 15;
		break;
		case oOverhealthRune:
		oPlayerManager.hasOverhealthRune = true;
		break;
		case oXPReducedRune:
		oPlayerManager.hasXPRune = true;
		oPlayerManager.xpRuneReduction = 2;
		break;
		case oSifterRune:
		oPlayerManager.hasSifterRune = true;
		break;
	}
}
function disableRune(_rune){
	switch (_rune) {
		case oItemDenyRune:
		oPlayerManager.hasItemDenyRune = false;
		break;
		case oPowerUpRune:
		oPlayerManager.hasPowerUpRune = false;
		break;
		case oSifterRune:
		oPlayerManager.hasSifterRune = false;
		case oVeribroseRune:
		oPlayerManager.hasVeribroseRune = false;
		break;
		case oTorzolRune:
		oPlayerManager.hasTorzolRune = false;
		break;
		case oVirstRune:
		oPlayerManager.hasVirstRune = false;
		break;
		case oBossRune:
		oPlayerManager.hasBossRune = false;
		break;
		case oTrapRune:
		oPlayerManager.hasTrapRune = false;
		break
		case oKrostRune:
		oPlayerManager.hasKrostRune = false;
		oPlayerManager.krostRuneDebuff = 1;
		break;
		case oAlextraRune:
		oPlayerManager.hasAlextraRune = false;
		oLightManager.darkLevel = 0.5;
		break;
		case oBossDropRune:
		oPlayerManager.hasBossDropRune = false;
		break;
		case oBulletRangeRune:
		oPlayerManager.hasBulletRangeRune = false;
		break;
		case oExplosiveRune:
		oPlayerManager.hasExplosiveRune = false;
		break;
		case oLifestealRune:
		oPlayerManager.hasLifestealRune = false;
		break;
		case oLuckRune:
		oPlayerManager.hasLuckRune = false;
		break;
		case oOverhealthRune:
		oPlayerManager.hasOverhealthRune = false;
		break;
		case oXPReducedRune:
		oPlayerManager.hasXPRune = false;
		oItemManager.luckBonus += 15;
		break;
	}
}