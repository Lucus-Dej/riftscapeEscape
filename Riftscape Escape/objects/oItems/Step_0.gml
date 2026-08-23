if (oItemManager.hasVirstEssence && object_index != oDepictionOfSeraphim) {
	randomItem = true;
}
if (idleTime > 0) {
	idleTime--;
} else if (randomItem) {
	var newitem = rollItem(false, itemSearchType.random, false);
	instance_create_layer(x, y, "Items", newitem, {randomItem: true});
	instance_destroy()
}
if (displayDesc) {
	displayItemFunction(object_index);
}