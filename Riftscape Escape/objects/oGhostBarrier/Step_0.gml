if (instance_exists(oFloorManager)) {
	if (doorType == "item" && instance_exists(Manager1) && !challengeAccepted) {
		Manager1.isChallenge = true;
		challengeAccepted = true;
	}
	if (isBossDoor == true && instance_exists(wall)) {
		//instance_destroy(wall)
	}
if (state == doorState.init) {
	with (oRoomManager) {
		event_user(13);
		event_user(11);
	}
	if (RoomID != 0) {
		RoomID1 = RoomID;
	} else {
		RoomID = RoomID1
	}
	show_debug_message(state)
	state = doorState.lookingForManager1
} else if (state == doorState.lookingForManager1) {
	show_debug_message("SEARCHING FOR MANAGER")
	with (oRoomManager) {
		if (RoomID == other.RoomID1) {
			other.Manager1 = id;
			array_push(doorList, other.id)
			workerDoor1 = other.id;
		}
	}
	if (Manager1 == noone) {
		state = doorState.done;
		show_debug_message("i can't find a manamager"+string(RoomID1))
		show_debug_message(RoomID)
	} else {
		state = doorState.searchingForDoor2;
		show_debug_message(state)
	}
} else if (state == doorState.searchingForDoor2) {
	var doorCheck = getMatchingDoorObject(self.object_index)
	var check = collision_circle(x, y, 64, doorCheck, false, true);
	//var checkDir = getOppositeDoorDir(doorDir);
	if (check != noone) {
		if (check.object_index == doorCheck && RoomID1 != 0) {
			show_debug_message("RoomID2 just changed")
			check.RoomID2 = RoomID1;
			check.Manager2 = Manager1;
			foundOther = true;
			soulMate = check;
			state = doorState.lookingForManager2;
			
		} 
	} else {
		show_debug_message("wall placed")
		wall = instance_create_layer(x, y, "Instances", oFlexWall);
		instance_destroy(childDoor)
		state = doorState.done
	}
} else if (state == doorState.lookingForManager2) {

	if (instance_exists(soulMate)) {
		childDoor = instance_create_layer(x, y, "Instances", oBarrier);
	} else {
		
		show_debug_message("ERROR. Lost soulmate")
	}
	if (doorType == "boss") {
		childDoor.sprite_index = sBossBarrier;
	}
	used = true;
	childDoor.RoomID = RoomID1;
	childDoor.owner = id;
	state = doorState.done;
}
} else {
	if (!used && onStart && !instance_exists(oFloorManager)) {
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

if (wall != noone && state == doorState.done && foundOther) {
	instance_destroy(wall)
}
if (RoomID2 == 0 && state == doorState.done) {
	if (instance_exists(childDoor)) instance_destroy(childDoor);
	instance_destroy()
}