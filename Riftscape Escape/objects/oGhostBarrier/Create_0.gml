Manager1 = noone;
Manager2 = noone;
used = false;
childDoor = noone;
roomBuilder = noone;
checked = false;
wall = noone;
soulMate = noone;
validForSpecialRoom = true;
doorType = "null";
invalid = false;
invalidBlock = noone;
lastRoomID2 = RoomID2;
spawned = false;
isBossDoor = false;
foundOther = false;
RoomID = 0;
special = false;
challengeAccepted = false;
enum doorState {
	idle,
	init,
	lookingForManager1,
	searchingForDoor2,
	lookingForManager2,
	done
}
state = doorState.idle;