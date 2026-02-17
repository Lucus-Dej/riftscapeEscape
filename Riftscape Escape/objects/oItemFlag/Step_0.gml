if (instance_exists(Manager)) {
if (Manager.combatFinished && !used) {
	with (oItemManager) {
		searchItem = true;
		dropID = other.id;
	}
	used = true
	}
	//instance_create_layer(100,100, "Instances", oBoss);
}

if (onStart && !used) {
	with (oItemManager) {
		searchItem = true;
		dropID = other.id;
	}
	used = true
}
if (spawnItem) {
	instance_create_layer(x, y, "Instances", item)
	spawnItem = false;
}