if (instance_exists(Manager)) {
if (Manager.combatFinished && !used) {
	with (oItemManager) {
		searchItem = true;
		dropID = other.id;
	}
	
	used = true
	}
	//instance_create_layer(x,y, "Instances", oBoss);
}

if (onStart && !used && Manager != noone) {
	with (oItemManager) {
		searchItem = true;
		dropID = other.id;
	}
	
	used = true
}
if (spawnItem && item != noone) {
	instance_create_layer(x, y, "Instances", item)
	spawnItem = false;
}
if (Manager == noone) {
	//Manager = findManager()
}
