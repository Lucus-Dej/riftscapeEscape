if (instance_exists(oRoomManager)) {
	with (oRoomManager) {
		if (RoomID == other.RoomID) {
		other.Manager = id;
		}
	}
}

