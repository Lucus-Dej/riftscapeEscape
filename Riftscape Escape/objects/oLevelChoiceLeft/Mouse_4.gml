with oLevelChoiceRight {
	if (buttonID == other.buttonID) {
		valid = false;
	}
}
with (oUpgradeTokenReal) {
	image_index = 8;
	if (upgradeID == other.buttonID) {
		spent = true;
		image_index = 8;
		show_debug_message("I am spent")
	}
}
if (levelMet && valid && !hasChosen) {
	valid = false;
	image_alpha = 0.5;
	hasChosen = true;
	switch (buttonID) {
	case (1):
	oPlayerManager.initCircle = true;
	oPlayerManager.fateTokenSpent = true;
	break;
	case (2):
	oPlayerManager.initMinion = true;
	oPlayerManager.lifeTokenSpent = true;
	break;
	case (3):
	oPlayerManager.initDodge = true;
	oPlayerManager.realityTokenSpent = true;
	break;
	case (4):
	oPlayerManager.initHusk = true;
	oPlayerManager.thoughtTokenSpent = true;
	break;
	case (5):
	oPlayerManager.initCrystal = true;
	oPlayerManager.timeTokenSpent = true;
	break;
	case (6):
	oPlayerManager.essenceTokenSpent = true;
	oPlayerManager.initate_sword = true;
	break;
}
}