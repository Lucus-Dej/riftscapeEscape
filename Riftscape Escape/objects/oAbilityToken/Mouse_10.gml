if (!displaying) {
	with (oUpgradeTokenStatic) {
		displaying = false;
	}
	desc = displayAbilityDesc(abilityID, global.currentUpgradeID);
	with (oAbilityUpgradeTextbox) {
		desc = other.desc;
		descLength = string_width(desc)
	}
	displaying = true;
}
