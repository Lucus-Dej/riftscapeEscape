function getRuneDesc(_rune){
	//if (array_contains(oPlayerManager.activeRuneArray, _rune)) {
	//	sprite_index = sNullRune;
	//	return "Dull Rune: No Effect; No Reward";
	//}
	var runeDesc = "";
	switch (_rune) {
		case oDullRune:
		desc = "Dull Rune: No Effect; No Reward";
		break;
		case oBossDropRune:
		desc = "Bosses No Longer Drop Items";
		break;
		case oBulletRangeRune:
		desc = "Bullet Existance Is Halved";
		break;
		case oExplosiveRune:
		desc = "Enemies Drop An Explosive On Death";
		break;
		case oLifestealRune:
		desc = "Bullet Lifesteal Is Disabled";
		break;
		case oLuckRune:
		desc = "Luck Is Massively Reduced";
		break;
		case oOverhealthRune:
		desc = "Overhealth Is Disabled";
		break;
		case oXPReducedRune:
		desc = "XP Gain Is Halved";
		break;
		case oCooldownRune:
		desc = "Ability Cooldown Is Doubled And Only Recharge In Combat";
		break;
	}
	return desc;
}

function enableRune(_rune){
	switch (_rune) {
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
		oItemManager.luckBonus -= 25;
		break;
		case oOverhealthRune:
		oPlayerManager.hasOverhealthRune = true;
		break;
		case oXPReducedRune:
		oPlayerManager.hasXPRune = true;
		oPlayerManager.xpRuneReduction = 2;
		break;
		case oCooldownRune:
		oPlayerManager.crystalMax *= 2;
		oPlayerManager.swordMax *= 2;
		oPlayerManager.huskMax *= 2;
		oPlayerManager.circleMax *= 2;
		oPlayerManager.dodgeMax *= 2;
		oPlayerManager.hasCooldownRune = true;
		break;
	}
}
function disableRune(_rune){
	switch (_rune) {
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
		break;
	}
}