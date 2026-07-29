if (spawner == noone && ID != -1) {
	spawner = instance_nearest(x, y, oRitualRoomBossSpawnMarker);
	spawner.ID = ID;
	spawner.RoomID = RoomID;
}

if (manager == noone && ID != -1) {
	with (oRitualRoomManager) {
		if (RoomID == other.RoomID) {
			other.manager = id;
		}
	}
}

if (instance_exists(spawner) && instance_exists(manager) && child == noone) {
	child = instance_create_layer(x, y, "Instances", oRitualRoomSpawner);
	child.watcher = id;
	child.ID = ID;
	child.manager = manager;
	child.RoomID = RoomID;
	child.target = spawner;
	spawner.manager = manager;
}