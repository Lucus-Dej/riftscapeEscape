level = 1;
doorList = ds_list_create();
doorCount = 0;
IDCount = 1;
global.roomQueue = ds_queue_create();
global.roomStack = ds_stack_create();
currentRequest = noone;

enum genState {
	idle, 
	generating, 
	complete
}
floorState = genState.idle;
bossDoorArray = [];
done = false;