with (oGhostBarrier) {
	if (RoomID == other.RoomID && !linked) {
		var index = array_get_index(other.usedDoorArray, id);
		if (index == -1) {
			array_push(other.usedDoorArray, id);
			ds_queue_enqueue(other.doorQueue, id);
		}
	}
}
if(ds_queue_size(doorQueue) > 0) {
	
	var inst = ds_queue_head(doorQueue);
	ds_queue_dequeue(doorQueue);
	with (inst) {
		if (oFloorManager.deep <= 0) {
			//instance_create_layer(x, y, "Instances", oWastelandWall)
			continue;
		}
		newRoom = findRoom(doorDir);
		
		if (newRoom != noone) {
			//connectRoom(self, doorDir, newRoom, other.owner);
			var request = {
				door: id,
				dir: doorDir,
				room: newRoom,
				owner: other.owner
			};
			if (irandom(100) < 75) {
				 ds_stack_push(global.roomStack, request);
			} else {
				ds_queue_enqueue(global.roomQueue, request);
			}
		}
	}
}

if (owner != noone && !used && instance_exists(oFloorManager)) {
	
	
	with (oRoomClaimX) {
		if (RoomID == other.RoomID) {
			other.workerX = id;
		}
	}
	with (oRoomClaimY) {
		if (RoomID == other.RoomID) {
			other.workerY = id;
		}
	}
	/*
	with (oGhostBarrier) {
		show_debug_message("I AM ATTEMPING TO ADD TO MY BUILDER")
		if ((RoomID == other.RoomID)) {
			instance_create_layer(x, y, "Instances", oDepictionOfSeraphim)
			if (!checked) {
				ds_list_add(other.doorList, id);
				roomBuilder = other.id ;
			}
		}
	}*/
	//width = abs(owner.workerY.x - owner.workerX.x - 64 - 128);
	//show_debug_message(width)
	//show_debug_message(newRoom)
	event_user(0)
	
	//}
}
