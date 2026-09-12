if (room != hordeSurvival && room != itemRoom && object_index != oDepictionOfSeraphim && !shopItem) {
	oItemManager.luckBonus += rarity+1;
	if (oItemManager.hasDoubleOrNothing) {
		array_push(oItemManager.donArray, object_index)
	}
}