var qsize = ds_queue_size(global.roomQueue)
var Ssize = ds_stack_size(global.roomStack)

var totSize = qsize + Ssize;
var doNext = noone;


if (totSize > 0 && deep > 0) {
	floorState = genState.generating;
	var req = noone;
	var i = irandom(100)
	if (i > 60) {
		doNext = "q";
	} else {
		doNext = "s";
	}
	if (Ssize > 0 && doNext == "s") {
		req = ds_stack_pop(global.roomStack);
		show_debug_message(req)
	} else if (qsize > 0 && doNext == "q") {
		req = ds_queue_dequeue(global.roomQueue);
		show_debug_message(req)
	} else if (Ssize > 0) {
		req = ds_stack_pop(global.roomStack);
	} else if (qsize > 0) {
		req = ds_queue_dequeue(global.roomQueue);
	}
	
	if (req != undefined)
    if (instance_exists(req.door)) {
        with (req.door) {
            connectRoom(id, req.dir, req.room, req.owner);
        }
		deep -= 1;
    }
}
if (totSize <= 0 && deep <= 0) {
	instance_destroy(oRoomReserve)
	floorState = genState.complete;
} else if (totSize > 0 && deep <= 0) {
	ds_queue_clear(global.roomQueue);
	ds_stack_clear(global.roomStack);
}
if (floorState = genState.complete && !done) {
	with (oGhostBarrierDirectionalParent) {
		if (!spawned) {
			array_push(other.bossDoorArray, id);
		}
	}
	var bossIndex = irandom(array_length(bossDoorArray)-1);
	var bossDoor = bossDoorArray[bossIndex];
	with (bossDoor) {
		isBossDoor = true;
		instance_create_layer(x, y, "Instances", oBossBarrier);
	}
	with (oGhostBarrierDirectionalParent) {
		if (!spawned && !isBossDoor) {
			instance_create_layer(x, y, "Instances", oWastelandWall);
			instance_destroy();
		}
	}
}