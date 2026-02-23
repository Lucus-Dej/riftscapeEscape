if (owner != noone && !used) {
	
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
		if (checked) {
			continue;
		} else {
			roomBuilder = other.id;
			other.newRoom = findRoom(doorDir)
			connectRoom(self, doorDir, other.newRoom, other.owner);
			other.doorCount++;
		}
	}
	//width = abs(owner.workerY.x - owner.workerX.x - 64 - 128);
	show_debug_message(width)
	show_debug_message(newRoom)
	used = true;
}
