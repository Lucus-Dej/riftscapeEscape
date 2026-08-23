faded = false;
image_alpha = 1 - combatAlphaPenalty*2;
if (levelMet && !hasChosen && valid) {
	with (oAbilityToken) {
		if (other.buttonID == abilityID) {
			doFlash = false;
		}
	}
}