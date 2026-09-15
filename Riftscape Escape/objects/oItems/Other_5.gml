if (room != hordeSurvival && room != itemRoom && object_index != oDepictionOfSeraphim && !shopItem) {
	oItemManager.luckBonus += rarity+1;
	show_debug_message("MY RARITY IS: "+string(rarity))
	if (rarity == 0 && !global.meta.challenges.gotItemHollowedDice) {
		global.lifestats.simpleSkipped++;
		if (global.lifestats.simpleSkipped >= 50) {
			global.meta.challenges.gotItemHollowedDice = true;
			showChallenge("gotItemHollowedDice");
		}
	}
	if (rarity == 4 && !global.meta.challenges.gotItemFoolsGold) {
		showChallenge("gotItemFoolsGold");
		global.meta.challenges.gotItemFoolsGold = true;
	}
	if (oItemManager.hasDoubleOrNothing) {
		array_push(oItemManager.donArray, object_index)
	}
}