var qsize = ds_queue_size(global.roomQueue)
var Ssize = ds_stack_size(global.roomStack)

var totSize = qsize + Ssize;
var doNext = noone;


if (totSize > 0 && deep > 0) {
	floorState = genState.generating;
	var req = noone;
	var i = irandom(100)
	if (i > 60) {
		doNext = "q";
	} else {
		doNext = "s";
	}
	if (Ssize > 0 && doNext == "s") {
		req = ds_stack_pop(global.roomStack);
		show_debug_message(req)
	} else if (qsize > 0 && doNext == "q") {
		req = ds_queue_dequeue(global.roomQueue);
		show_debug_message(req)
	} else if (Ssize > 0) {
		req = ds_stack_pop(global.roomStack);
	} else if (qsize > 0) {
		req = ds_queue_dequeue(global.roomQueue);
	}
	
	if (req != undefined)
    if (instance_exists(req.door)) {
        with (req.door) {
            connectRoom(id, req.dir, req.room, req.owner);
        }
		deep -= 1;
    }
}
if (totSize <= 0 && deep <= 0 && !done) {
	instance_destroy(oRoomReserve)
	floorState = genState.complete;
	done = true;
} else if (totSize > 0 && deep <= 0) {
	ds_queue_clear(global.roomQueue);
	ds_stack_clear(global.roomStack);
}
if (floorState == genState.complete ) {
	floorState = genState.checkingDoors;
	with (oRoomManager) {
		floorID = other.floorID;
		diffPool = other.difficultyPool;
		var request = getEnemPool(floorID)
		request.bArray = bossArray;
		request.normArray = enemArray;
		request.cArray = challengeArray;
		event_user(1);
		event_user(3);
	}
	
} else if (floorState == genState.checkingDoors) {
	if (!doorStart) {
		with (oGhostBarrierDirectionalParent) {
			state = doorState.init;
		}
		doorStart = true;
	}
	if (doorTimer > 0) {
		doorTimer --;
	}
	if (doorTimer <= 0) {
		with (oGhostBarrierDirectionalParent) {
			if (!spawned && !foundOther && state == doorState.searchingForDoor2) {
				array_push(other.bossDoorArray, id);
			}
		}
		floorState = genState.buildingSpecialRooms;
	}
} else if (floorState == genState.buildingSpecialRooms) {
	var bossIndex = irandom(array_length(bossDoorArray)-1);
	var bossDoor = bossDoorArray[bossIndex];
	var dir = bossDoor.doorDir;
	var BossR = findSpecialRoom(dir, "boss");
	with (bossDoor) {
		isBossDoor = true;
		doorType = "boss";

		show_debug_message("boss door made")
		connectRoom(id, dir, BossR, Manager1);
	}
	var itemRoomIndex = irandom(array_length(bossDoorArray)-1);
	while (itemRoomIndex == bossIndex) {
		itemRoomIndex = irandom(array_length(bossDoorArray)-1);
	}
	var itemDoor = bossDoorArray[itemRoomIndex];
	dir = itemDoor.doorDir;
	itemDoor.special = true;
	var itemR = findSpecialRoom(dir, "item");
	with (itemDoor) {
		doorType = "item";
		connectRoom(id, dir, itemR, Manager1);
	}
	floorState = genState.runRoomManagers;
} else if (floorState == genState.runRoomManagers) {
	with (oGhostBarrierDirectionalParent ) {
		if (!spawned && !isBossDoor && !foundOther && !isBossDoor && !special) {
			wall = instance_create_layer(x, y, "Instances", oWastelandWall);
			instance_destroy(childDoor)
		}
	}
	with (oRoomManager) {
		floorID = other.floorID;
		diffPool = other.difficultyPool;
		var request = getEnemPool(floorID)
		request.bArray = bossArray;
		request.normArray = enemArray;
		request.cArray = challengeArray;
		event_user(1);
		event_user(3);
	}
	if (instance_exists(oBossStart)) {
		with (oBossStart) {
			findManager()
			var i = irandom(array_length(Manager.bossArray)-1);
			var boss = Manager.bossArray[i];
			bossName = boss;
			bossCount = 1;
			
		}
	}
	instance_destroy(oRoomReserve)
	floorState = genState.done;
}
