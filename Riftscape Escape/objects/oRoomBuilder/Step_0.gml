if (owner != noone && !used && instance_exists(oFloorManager)) {
	if (oFloorManager.deep > 0) {
	
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
	with (oGhostBarrier) {
		if ((RoomID1 == other.RoomID) || (RoomID2 == other.RoomID)) {
		show_debug_message("CHECKING DOOR")
		if (!checked) {
			show_debug_message("DOOR IS NOT CHECKED")
			
			ds_list_add(other.doorList, id);
			roomBuilder = other.id ;
		} else {
			show_debug_message("DOOR IS CHECKED")
		}
	}
	}
	//width = abs(owner.workerY.x - owner.workerX.x - 64 - 128);
	show_debug_message(width)
	//show_debug_message(newRoom)
	event_user(0)
	used = true;
	}
}
