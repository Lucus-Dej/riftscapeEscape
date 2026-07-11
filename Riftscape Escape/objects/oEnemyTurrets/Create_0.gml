// Inherit the parent event
event_inherited();
searchTimer = 12;
searchCooldown = searchTimer;
flash = 0;
canSeePlayer = false;
target = oTruePlayer;
active = false;
Manager = noone
searchManager = true;
searchPlayer();
enum TURRET_TYPE {
	BLACKHOLE, FIRE, BULLET, NULL
}
with (oRoomManager) {
	if (RoomID == other.RoomID) {
		other.Manager = id;
	}
}
type = TURRET_TYPE.NULL;