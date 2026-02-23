function findManager(){
	if (instance_exists(oRoomManager)) {
		with (oRoomManager) {
			if (RoomID == other.RoomID) {
				other.Manager = id;
			}
		}
		return Manager;
	} else {
		return noone;
	}
}