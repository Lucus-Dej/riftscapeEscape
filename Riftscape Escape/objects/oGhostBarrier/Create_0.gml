Manager1 = noone;
Manager2 = noone;
used = false;
childDoor = noone;
roomBuilder = noone;
checked = false;
wall = noone;

doorType = "null";
invalid = false;
invalidBlock = noone;
spawned = false;
isBossDoor = false;
foundOther = false;
RoomID = 0;
special = false;
enum doorState {
	idle,
	init,
	lookingForManager1,
	searchingForDoor2,
	lookingForManager2,
	done
}
state = doorState.idle;