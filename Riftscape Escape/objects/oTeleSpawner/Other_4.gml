if (instance_exists(oRoomManager)) {
	with (oRoomManager) {
		if (RoomID == other.RoomID) {
		other.Manager = id;
		}
	}
}

if (!con) {
	child_spawner = instance_create_layer(x, y, "Instances", oGoNext);
	if (evil) {
		evilChild = instance_create_layer(x, y, "Instances", oGoNextEvil);
		with (evilChild) {
			owned = other.id;
		}
	}
	with (child_spawner) {
		owned = other.id;
	}
	childSpawned = true;
}
