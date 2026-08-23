if (!displaying && image_index != 0 && storedUpgradeId != -1) {
	desc = displayAbilityDesc(ownerID, storedUpgradeId);
	with (oAbilityUpgradeTextbox) {
		desc = other.desc;
		descLength = string_width(desc)
	}
	displaying = true;
}