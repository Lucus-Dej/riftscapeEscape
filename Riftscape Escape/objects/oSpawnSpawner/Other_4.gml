if (instance_exists(oRoomManager)) {
	with (oRoomManager) {
		if (RoomID == other.RoomID) {
		other.Manager = id;
		}
	}
}

if (!con) {
	child_spawner = instance_create_layer(x, y, "Instances", oStartRoom);
	childSpawned = true;
}