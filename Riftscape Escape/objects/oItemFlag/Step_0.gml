if (instance_exists(Manager) && Manager.object_index != oWavebasedManager) {
if (Manager.combatFinished && !used) {
	with (oItemManager) {
		show_debug_message("HELP I AM UNDER THE SAND")
		if (other.bossRoom) {
			var newItem = rollItem(false, itemSearchType.boss);
			spawnItem(newItem, other.id, other.RoomID);
		} else {
			var newItem = rollItem(false);
			spawnItem(newItem, other.id, other.RoomID);
			//spawnItem(newItem, id);
		}
		/*searchItem = true;
		dropID = other.id;
		if (other.bossRoom) {
			event_user(2);
			bossSearch = true;
		} */
	}
	
	used = true
	}
	//instance_create_layer(x,y, "Instances", oBoss);
}

if (onStart && !used && !veribroseItem) {
	show_debug_message("yo just tried to spawn an item")
	//Manager.combatFinished = true;
	with (oItemManager) {
		show_debug_message("HELP I AM UNDER THE WATER")
		if (other.bossRoom) {
			var newItem = rollItem(false, itemSearchType.boss);
			spawnItem(newItem, other.id, other.RoomID);
		} else {
			var newItem = rollItem(true);
			spawnItem(newItem, other.id, other.RoomID);
			
		}
		/*searchItem = true;
		dropID = other.id;
		if (other.bossRoom) {
			event_user(2);
			bossSearch = true;
		} */
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
/*if (spawnItem && item != noone) {
	show_debug_message("yo just tried to spawn an item 2")
	summon = instance_create_layer(x, y, "Instances", item);
	summon.rarity = rarity;
	spawnItem = false;
	summon.RoomID = RoomID;
	summon.flag = id;
} */
if (Manager == noone) {
	//Manager = findManager()
}
if (veribroseCleanse && instance_exists(oItems)) {
	//with (oItems) {
	//	instance_destroy();
	//}
}