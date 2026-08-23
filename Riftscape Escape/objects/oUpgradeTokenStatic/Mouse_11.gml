var descTest = displayAbilityDesc(ownerID, storedUpgradeId);
if (displaying) {
	displaying = false;
	with (oAbilityUpgradeTextbox) {
		if (desc == descTest) {
			desc = defDesc;
		}
	}
	with (oAbilityToken) {
		if (displaying) {
			with (oAbilityUpgradeTextbox) {
				desc = other.desc;
				descLength = string_width(desc)
			}
		}
	}
}
