conMet = false;
conMetInt = 0;
used = false;
Manager = noone;
gone = false;
childSpawned = false;
childSpawner = noone;
if (instance_exists(oWavebasedManager) && !instance_exists(oFloorManager)) {
	with (oWavebasedManager) {
		if (RoomID == other.RoomID) {
			other.Manager = id;
			roomStarter = other.id;
		}
	}
}

