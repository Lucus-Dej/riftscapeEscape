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

if (!con) {
	child_spawner = instance_create_layer(x, y, "Instances", oStartRoom);
	childSpawned = true;
	child_spawner.owner = id;
	child_spawner.spawnID = RoomID;
}