for (var i = 0; i < array_length(donArray); i++) {
	show_debug_message(donArray)
	var donCheck = irandom_range(1, 2);
	if (donCheck == 2) {
		luckBonus += 1;
		var item = rollItem(false);
		var spawn = instance_create_layer(oPlayerSpawnPoint.x, oPlayerSpawnPoint.y, "Instances", item);
	} else {
		luckBonus -= 4;
	}
	array_delete(donArray, i, 1);
}

