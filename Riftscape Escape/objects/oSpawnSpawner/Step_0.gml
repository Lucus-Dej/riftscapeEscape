if (con && !used && Manager != noone) {
	if (conMet && !childSpawned) {
		childSpawned = true;
		child_spawner = instance_create_layer(x, y, "Instances", oStartRoom);
		with (child_spawner) {
			spawnID = other.id;
			RoomID = other.Manager.RoomID;
		}
		child_spawner.RoomID = Manager.RoomID;
	}
}
if (childSpawned == true && !used && Manager != noone) {
	if (!instance_exists(child_spawner)) {
		Manager.destroyWalls = true;
		Manager.roomStart = true;
		used = true;
	}
}
if (Manager == noone) {
	Manager = findManager()
}