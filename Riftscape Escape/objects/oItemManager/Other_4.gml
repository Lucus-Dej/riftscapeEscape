for (var i = 0; i < array_length(donArray); i++) {
	show_debug_message(donArray)
	var donCheck = irandom_range(1, 100);
	if (donCheck >= 40) {
		oItemManager.luckBonus += 0.25;
		var item = rollItem(true);
		var spawn = instance_create_layer(oPlayerSpawnPoint.x, oPlayerSpawnPoint.y, "Instances", item);
		var item2 = rollItem(true);
		var spawn2 = instance_create_layer(oPlayerSpawnPoint.x, oPlayerSpawnPoint.y, "Instances", item2);
	} 
	array_delete(donArray, i, 1);
}
if (hasFoolsGold && foolsGoldItem != noone)
if (foolsGoldTimer > 0) {
	foolsGoldTimer--;
} else {
	itemRemove(foolsGoldItem);
}
