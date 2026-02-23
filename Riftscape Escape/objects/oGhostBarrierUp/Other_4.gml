with (oRoomManager) {
	if (RoomID == other.RoomID1) {
		other.Manager1 = id;
	}
}
with (oRoomManager) {
	if (RoomID == other.RoomID2) {
		other.Manager2 = id;
	}
}
if (!used && onStart) {
	childDoor = instance_create_layer(x, y, "Instances", oBarrier);
	used = true;
}