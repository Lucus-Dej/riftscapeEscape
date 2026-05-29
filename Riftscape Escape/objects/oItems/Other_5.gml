if (instance_exists(oFloorManager) && object_index != oDepictionOfSeraphim) {
	oItemManager.luckBonus += rarity+1;
	if (oItemManager.hasDoubleOrNothing) {
		array_push(oItemManager.donArray, object_index)
	}
}