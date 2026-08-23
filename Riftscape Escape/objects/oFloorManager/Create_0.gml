level = 1;
challengeDoorID = -2;
retryCount = 0;
doorList = ds_list_create();
doorCount = 1;
IDCount = 1;
bossRoomSlain = false;
debugFloorGrids = [];
global.roomQueue = ds_queue_create();
global.roomStack = ds_stack_create();
currentRequest = noone;
doorTimer = 12;
enum genState {
	idle, 
	generating, 
	complete, 
	checkingDoors,
	buildingSpecialRooms,
	runRoomManagers,
	done
}
evilRoomFlag = false;
floorState = genState.idle;
bossDoorArray = [];
bossRoomID = -1;
done = false;
doorStart = false;
levelArray = [caves0, caves01, f3]
startingIndex = 0;
nextLevel = levelArray[startingIndex];
initGenComplete = false;
switch (room) {
	case desert0:
	changeTrack(desertTemples)
	break;
	
	case kingdom0:
	changeTrack(aLongDrawnBreath)
	break;
}
floorCompleteFlag = false;
roomManagerArray = [];
veribroseLockArray = [];