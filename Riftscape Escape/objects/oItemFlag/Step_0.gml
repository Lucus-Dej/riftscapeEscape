if (instance_exists(Manager) && Manager.object_index != oWavebasedManager) {
if (Manager.combatFinished && !used) {
	with (oItemManager) {
		searchItem = true;
		dropID = other.id;
		if (other.bossRoom) {
			event_user(2);
			bossSearch = true;
		}
	}
	
	used = true
	}
	//instance_create_layer(x,y, "Instances", oBoss);
}

if (onStart && !used && !veribroseItem) {
	show_debug_message("yo just tried to spawn an item")
	//Manager.combatFinished = true;
	with (oItemManager) {
		searchItem = true;
		dropID = other.id;
		if (other.bossRoom) {
			bossSearch = true;
		}
	}
	used = true
}
if (onStart && !used && veribroseItem) {
	used = true
	item = rollItem(false);
	if (object_exists(item)) {
		summon = instance_create_layer(x, y, "Instances", item);
		summon.veribroseMark = true;
		summon.RoomID = RoomID;
	}
	
	
}
if (spawnItem && item != noone) {
	show_debug_message("yo just tried to spawn an item 2")
	summon = instance_create_layer(x, y, "Instances", item);
	summon.rarity = rarity;
	spawnItem = false;
	summon.RoomID = RoomID;
	summon.flag = id;
} 
if (Manager == noone) {
	//Manager = findManager()
}
if (veribroseCleanse && instance_exists(summon)) {
	with (summon) {
		instance_destroy();
	}
}