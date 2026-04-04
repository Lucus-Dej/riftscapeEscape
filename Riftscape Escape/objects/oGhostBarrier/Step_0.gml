if (instance_exists(oFloorManager)) {
	if (isBossDoor == true && instance_exists(wall)) {
		instance_destroy(wall)
	}
if (state == doorState.init) {
	if (RoomID != 0) {
	RoomID1 = RoomID;
	show_debug_message(state)
	state = doorState.lookingForManager1
	} else {
		RoomID = RoomID1
	}
	
}
if (state == doorState.lookingForManager1 && !invalid) {
	show_debug_message("SEARCHING FOR MANAGER")
	with (oRoomManager) {
		if (RoomID == other.RoomID1) {
			other.Manager1 = id;
			array_push(doorList, other.id)
			workerDoor1 = other.id;
		}
	}
	childDoor = instance_create_layer(x, y, "Instances", oBarrier);
	if (doorType == "boss") {
		childDoor.sprite_index = sBossBarrier;
	}
	used = true;
	childDoor.RoomID = RoomID1;
	childDoor.owner = id;
	state = doorState.searchingForDoor2;
	show_debug_message(state)
}
if (state == doorState.searchingForDoor2) {
	var check = collision_rectangle(x+64, y+64, x-64, y-64, oGhostBarrierDirectionalParent, false, true);
	if (check != noone && check.RoomID1 != 0) {
		RoomID2 = check.RoomID1;
		foundOther = true;
		state = doorState.lookingForManager2;
		show_debug_message(state)
	}	
}
if (state == doorState.lookingForManager2 && Manager2 == noone) {
	with (oRoomManager) {
		if (RoomID == other.RoomID2) {
			other.Manager2 = id;
			array_push(doorList, other.id)
			other.state = doorState.done;
		}
	}
}
} else {
	if (!used && onStart) {
		childDoor = instance_create_layer(x, y, "Instances", oBarrier);
		if (doorType == "boss") {
		childDoor.sprite_index = sBossBarrier;
	}
		used = true;
		childDoor.RoomID = RoomID1;
		childDoor.owner = id;
	}
}
if (doorType == "boss") {
	if (instance_exists(childDoor) && childDoor.sprite_index != sBossBarrier)
	childDoor.sprite_index = sBossBarrier;
}
if (Manager1 != noone) {
	if (Manager1.combatFinished && instance_exists(childDoor)) {
		instance_destroy(childDoor);
	}
}
if (used) {
	if (instance_exists(Manager1) && instance_exists(Manager2)) {
		if (Manager1.combatFinished || Manager2.combatFinished) {
			instance_destroy(childDoor);
			used = false;
			}	
		} else if (instance_exists(Manager1) && !instance_exists(Manager2)) {
		if (Manager1.combatFinished) { 
			instance_destroy(childDoor);
			used = false;
		}
	} else if (!instance_exists(Manager1) && instance_exists(Manager2)) {
		if (Manager2.combatFinished) { 
			instance_destroy(childDoor);
			used = false;
		}
	}
}
if (invalid && invalidBlock == noone) {
	invalidBlock = instance_create_layer(x, y, "Instances", oWastelandWall)
}
if (state == doorState.done && childDoor == noone) {
	childDoor = instance_create_layer(x, y, "Instances", oBarrier);
	used = true;
	childDoor.RoomID = RoomID1;
	state = doorState.searchingForDoor2;
}
if (wall != noone && state == doorState.done) {
	instance_destroy(wall)
}
