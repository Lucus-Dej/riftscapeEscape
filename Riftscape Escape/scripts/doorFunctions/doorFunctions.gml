function powerDoor(_rID, _soulCheck = false){
	with (oGhostBarrier) {
		if (RoomID == _rID || RoomID2 == _rID) {
			powerDoorByID(id, _soulCheck)
		}
	}
}
function powerDoorByID(_ID, _soulCheck = false) {
	global.damageCheck = false;
	if (oItemManager.hasAlextraEssence) {
		oPlayerManager.invisTimer = 360;
	}
	with (_ID) {
		if (_soulCheck) {
			if (instance_exists(soulMate)) {
				powerDoorByID(soulMate);
			}
		}
		if (instance_exists(oFloorManager)) {
			if (!instance_exists(childDoor) && linked) {
				childDoor = instance_create_layer(x, y, "Instances", oBarrier)
				if (doorType == "boss") {
					childDoor.sprite_index = sBossBarrier;
				}
			}
		} else {
			if (!instance_exists(childDoor)) {
				childDoor = instance_create_layer(x, y, "Instances", oBarrier)
				if (doorType == "boss") {
					childDoor.sprite_index = sBossBarrier;
				}
			}
		}
	}
}
function unpowerDoor(_rID, _soulCheck = false){
	with (oGhostBarrier) {
		if (RoomID == _rID || RoomID2 == _rID) {
			unpowerDoorByID(id);
		}
	}
}
function unpowerDoorByID(_ID, _soulCheck = false){
	with (_ID) {
		if (veribroseRuneLocked) {
			awaitingUnlock = true;
			return;
		}
		if (instance_exists(childDoor)) {
			instance_destroy(childDoor)
		}
	}
}
function linkDoor(_rID, _door) {
	if (_rID == -1) {
		return;
	}
	var list = ds_list_create();
	var newDoor = getMatchingDoorObject(_door.object_index)
	collision_circle_list(_door.x, _door.y, 64, newDoor, true, true, list, true);
	
	if (ds_list_size(list) > 0) {
		with (list[| 0]) {
			other.linked = true;
			RoomID2 = _door.RoomID;
			Manager2 = _door.Manager1;
			foundOther = true;
			_door.soulMate = id;
		}
		
	}
	ds_list_destroy(list);
}
function revealNearbyRooms(_ID) {
	var id2 = -2;
	if (global.playerCanFly && oItemManager.freedomFlyFlag) {
		oItemManager.freedomFlyFlag = false;
	}
	with (_ID) {
		if (RoomID2 != -1) {
			id2 = RoomID2;
		}
	}
	if (id2 != -1)
	with (oRoomManager) {
		if (RoomID == id2) {
			hinted = true;
		}
		if (RoomID == _ID.RoomID) {
			if (!revealFlag) {
				revealFlag = true;
			}
		}
	}
}
function powerTorzol () {
	if (instance_exists(oTorzolFollower)) {
		oTorzolFollower.baseChaseSpeed += 0.4;
	}
	if (instance_exists(oTorzolFollowerSpawnerFlag))
	if (!oTorzolFollowerSpawnerFlag.spawned && !instance_exists(oTorzolFollower)) {
		spawned = true;
		with (oTorzolFollowerSpawnerFlag) {
			instance_create_layer(x, y, "Instances", oTorzolFollower);
		}
		
	}
}