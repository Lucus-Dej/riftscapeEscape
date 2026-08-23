if (levelMet && !hasChosen && valid) {
	faded = true;
	image_alpha = 0.5 - combatAlphaPenalty;
	with (oUpgradeTokenReal) {
		if (other.buttonID == upgradeID) {
			doFlash = true;
		}
	}
}