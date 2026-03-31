function findManager(){
	show_debug_message(object_index)
	if (instance_exists(oRoomManager)) {
		with (oRoomManager) {
			if (RoomID == other.RoomID) {
				other.Manager = id;
			}
			event_user(3);
			event_user(1);
		}
		return Manager;
	} else {
		return noone;
	}
}