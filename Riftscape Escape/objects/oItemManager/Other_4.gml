for (var i = 0; i < array_length(donArray); i++) {
	show_debug_message(donArray)
	var donCheck = irandom_range(1, 100);
	if (donCheck+global.playerTime*0.35 >= 40) {
		oItemManager.luckBonus += 0.2;
		var item = rollItem(true);
		var spawn = instance_create_layer(oPlayerSpawnPoint.x, oPlayerSpawnPoint.y, "Instances", item);
	} 
	array_delete(donArray, i, 1);
}
if (hasFoolsGold && foolsGoldItem != noone)
if (foolsGoldTimer > 0) {
	foolsGoldTimer--;
} else {
	itemRemove(foolsGoldItem);
}
