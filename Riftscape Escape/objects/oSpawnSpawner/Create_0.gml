conMet = false;
conMetInt = 0;
used = false;
Manager = noone;
gone = false;
childSpawned = false;
child_spawner = noone;

if (instance_exists(oRoomManager)) {
	with (oRoomManager) {
		if (RoomID == other.RoomID) {
		other.Manager = id;
		}
	}
}

