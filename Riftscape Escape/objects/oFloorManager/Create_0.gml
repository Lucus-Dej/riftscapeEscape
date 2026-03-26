level = 1;
doorList = ds_list_create();
doorCount = 1;
IDCount = 1;
global.roomQueue = ds_queue_create();
global.roomStack = ds_stack_create();
currentRequest = noone;
doorTimer = 2;
enum genState {
	idle, 
	generating, 
	complete, 
	checkingDoors,
	buildingSpecialRooms,
	runRoomManagers,
	done
}
floorState = genState.idle;
bossDoorArray = [];
done = false;
doorStart = false;
levelArray = [caves0, caves01, f3]
startingIndex = 0;
nextLevel = levelArray[startingIndex];