if (!hasChosen && !levelMet) {
	image_index = 0;
} else if (levelMet && !hasChosen) {
	image_index = 1;
} else if (hasChosen) {
	image_index = 2;
}

switch (buttonID) {
	case (1):
	if (levelThreshold <= global.playerFate) {
	levelMet = true;
	}
	break;
	case (2):
	if (levelThreshold <= global.playerLife) {
	levelMet = true;
	}
	break;
	case (3):
	if (levelThreshold <= global.playerReality) {
	levelMet = true;
	}
	break;
	case (4):
	if (levelThreshold <= global.playerThought) {
	levelMet = true;
	}
	break;
	case (5):
	if (levelThreshold <= global.playerTime) {
	levelMet = true;
	}
	break;
	case (6):
	if (levelThreshold <= global.playerEssence) {
	levelMet = true;
	}
	break;
}

