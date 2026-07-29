activeDuration = 90;

if (keyboard_check_pressed(vk_space) && object_index != oDullRune) {
	if (instance_exists(oRuneRoomFlag)) {
		unpowerDoor(RoomID);
		powerTorzol();
		with (oGhostBarrier) {
			if (RoomID == other.RoomID) {
				revealNearbyRooms(id);
			}
		}
	}
	array_push(oPlayerManager.activeRuneArray, object_index);
	//array_delete(oPlayerManager.validRuneArray, host.runeIndex, 1);
	enableRune(object_index);
	with (oRuneSpawner) {
		if (instance_exists(rune) && realRune && id != other.host) {
			array_push(oPlayerManager.validRuneArray, rune.object_index);
		}
	}
	with (oRune) {
		instance_destroy();
	}
	with (instance_nearest(x, y, oItemFlag)) {
		var newItem = rollItem(false, itemSearchType.rune);
		spawnItem(newItem, id, -1);
	}
}