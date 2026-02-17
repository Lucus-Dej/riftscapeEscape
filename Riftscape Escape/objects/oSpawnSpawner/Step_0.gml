if (con && !used) {
	if (conMet && !childSpawned) {
		childSpawned = true;
		child_spawner = instance_create_layer(x, y, "Instances", oStartRoom);
		with (child_spawner) {
			spawnID = other.id;
		}
	}
}
if (childSpawned == true && !used) {
	if (!instance_exists(child_spawner)) {
		Manager.destroyWalls = true;
		Manager.roomStart = true;
		used = true;
	}
}