if (con && !used && RoomID != 0) {
	if (conMet && !childSpawned) {
		childSpawned = true;
		child_spawner = instance_create_layer(x, y, "Instances", oStartRoom);
		with (child_spawner) {
			owner = other.id;
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
if (Manager == noone ) {
	Manager = findManager()
}
if (instance_exists(Manager) && Manager.isChallenge) {
	if (instance_exists(child_spawner))
	with child_spawner {
		sprite_index = sStartButtonEvil
	}
}
if (instance_exists(Manager) && !con && RoomID != 0 && !childSpawned) {
	child_spawner = instance_create_layer(x, y, "Instances", oStartRoom);
	childSpawned = true;
	child_spawner.owner = id;
	child_spawner.spawnID = RoomID;
	if (Manager.isChallenge) {
		with child_spawner {
			sprite_index = sStartButtonEvil
		}
	}
}