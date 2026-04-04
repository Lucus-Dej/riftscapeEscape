if (Manager == noone) {
	with (oWavebasedManager) {
		if (other.RoomID == RoomID) {
			other.Manager = id;
		}
	}
}