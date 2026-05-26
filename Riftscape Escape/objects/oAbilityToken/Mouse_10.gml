if (!displaying) {
	desc = displayAbilityDesc(abilityID, global.currentUpgradeID);
	with (oAbilityUpgradeTextbox) {
		desc = other.desc;
		descLength = string_width(desc)
	}
	displaying = true;
}
