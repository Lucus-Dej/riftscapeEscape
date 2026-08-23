if (levelMet && valid && !hasChosen) {
	faded = true;
	image_alpha = 0.5 - combatAlphaPenalty;
	with (oAbilityToken) {
		if (other.buttonID == abilityID) {
			doFlash = true;
		}
	}
}