with oLevelChoiceRight {
	if (buttonID == other.buttonID) {
		valid = false;
	}
}

if (levelMet && valid && !hasChosen) {
	valid = false;
	image_alpha = 0.5;
	hasChosen = true;
	switch (buttonID) {
	case (1):
	oPlayerManager.initCircle = true;
	break;
	case (2):
	oPlayerManager.initMinion = true;
	break;
	case (3):
	oPlayerManager.initDodge = true;
	break;
	case (4):
	oPlayerManager.initHusk = true;
	break;
	case (5):
	oPlayerManager.initCrystal = true;
	break;
	case (6):
	oPlayerManager.initate_sword = true;
	break;
}
}