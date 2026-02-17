with oLevelChoiceLeft {
	if (buttonID == other.buttonID) {
		valid = false;
	}
}
if (levelMet && !hasChosen && valid) {
	valid = false;
	image_alpha = 0.5;
	hasChosen = true;

	switch (buttonID) {
	case (1):
	oPlayerManager.hasFateToken = true;
	break;
	case (2):
	oPlayerManager.hasLifeToken = true;
	break;
	case (3):
	oPlayerManager.hasRealityToken = true;
	break;
	case (4):
	oPlayerManager.hasThoughtToken = true;
	break;
	case (5):
	oPlayerManager.hasTimeToken = true;
	break;
	case (6):
	oPlayerManager.hasEssenceToken = true;
	break;
}
}