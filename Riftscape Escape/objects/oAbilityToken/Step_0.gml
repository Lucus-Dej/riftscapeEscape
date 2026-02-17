

switch (abilityID) {
	case 0:
	break; 
	
	case 1:
	if (oPlayerManager.initCircle) {
		image_index = 1
		abilityGained = 1
	} else {
		image_index = 0
	}
	break;
	case 2:
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