function findManager(){
	var flag = false;
	var returnId = noone;
	//show_debug_message(object_index)
	if (instance_exists(oRoomManager)) {
		with (oRoomManager) {
			if (RoomID == other.RoomID) {
				event_user(3);
				event_user(1);
				other.Manager = id;
				return id;
				
			}
		}
	} else {
		return noone;
	}
}