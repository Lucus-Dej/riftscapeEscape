if (oItemManager.hasVirstEssence && object_index != oDepictionOfSeraphim) {
	randomItem = true;
}
if (idleTime > 0) {
	idleTime--;
} else if (randomItem) {
	var newitem = rollItem(false, itemSearchType.random, false);
	if (newitem != undefined) {
		var newPrice = findItemRarity(newitem)*3+2;
		var theNew = instance_create_layer(x, y, "Items", newitem, {randomItem: true, price: newPrice});
		theNew.shopItem = shopItem;
		
		instance_destroy()
	}
}
if (displayDesc) {
	displayItemFunction(object_index);
}