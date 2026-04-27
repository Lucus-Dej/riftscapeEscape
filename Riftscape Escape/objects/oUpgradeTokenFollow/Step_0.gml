if (upgradeID == 1) {
	if (oPlayerManager.hasFateToken && !upgradeSpent) {
		valid = true;
		image_index = 1;
	} else if (oPlayerManager.fateTokenSpent = true) {
		valid = false;
		image_index = 8;
	}
}
if (upgradeID == 2) {
	if (oPlayerManager.hasLifeToken && !upgradeSpent) {
		valid = true;
		image_index = 2;
	} else if (oPlayerManager.lifeTokenSpent = true) {
		image_index = 8;
		valid = false;
		
	}
}
if (upgradeID == 3) {
	if (oPlayerManager.hasRealityToken && !upgradeSpent) {
		valid = true;
		image_index = 3;
	} else if (oPlayerManager.realityTokenSpent = true) {
		valid = false;
		image_index = 8;
	}
}
if (upgradeID == 4) {
	if (oPlayerManager.hasThoughtToken && !upgradeSpent) {
		valid = true;
		image_index = 4;
	} else if (oPlayerManager.thoughtTokenSpent = true) {
		valid = false;
		image_index = 8;
	}
}
if (upgradeID == 5) {
	if (oPlayerManager.hasTimeToken && !upgradeSpent) {
		image_index = 5;
		valid = true;
	} else if (oPlayerManager.timeTokenSpent = true) {
		image_index = 8;
		valid = false;
	}
}
if (upgradeID == 6) {
	if (oPlayerManager.hasEssenceToken && !upgradeSpent) {
		valid = true;
		image_index = 6;
	} else if (oPlayerManager.essenceTokenSpent = true) {
		image_index = 8;
		valid = false;
	}
}
