var index = -1;
switch (buttonID) {
	case (1):
	//fate
	index = global.playerFate - 1;
	if (index > 5) {
		index = 5;
	}
	image_index = index;
	break;
	case (2):
	// life
	index = global.playerLife - 1;
	if (index > 5) {
		index = 5;
	}
	image_index = index;
	break;
	case (3):
	// reality
	index = global.playerReality - 1;
	if (index > 5) {
		index = 5;
	}
	image_index = index;
	break;
	case (4):
	// thought
	index = global.playerThought - 1;
	if (index > 5) {
		index = 5;
	}
	image_index = index;
	break;
	case (5):
	// time
	index = global.playerTime - 1;
	if (index > 5) {
		index = 5;
	}
	image_index = index;
	break;
	case (6):
	// essence
	index = global.playerEssence - 1;
	if (index > 5) {
		index = 5;
	}
	image_index = index;
	break;
}
if (global.inCombat) {
	image_alpha = 0.5;
} else {
	image_alpha = 1;
}
/*
switch (buttonID) {
	case (1):
	if (levelThreshold > global.playerFate) {
	levelMet = false;
	}
	break;
	case (2):
	if (levelThreshold > global.playerLife) {
	levelMet = false;
	}
	break;
	case (3):
	if (levelThreshold > global.playerReality) {
	levelMet = false;
	}
	break;
	case (4):
	if (levelThreshold > global.playerThought) {
	levelMet = false;
	}
	break;
	case (5):
	if (levelThreshold > global.playerTime) {
	levelMet = false;
	}
	break;
	case (6):
	if (levelThreshold > global.playerEssence) {
	levelMet = false;
	}
	break;
}

if (levelMet) {
	image_index = 1;
} else {
	image_index = 0;
}