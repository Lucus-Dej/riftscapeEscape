displaying = false;
var descTest = displayAbilityDesc(abilityID, global.currentUpgradeID);
with (oAbilityUpgradeTextbox) {
	if (desc == descTest) {
		desc = defDesc;
	}
}