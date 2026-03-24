show_debug_message("I AM EXECUTING THE BUILDING PROCESS")


if (oFloorManager.deep <= 0) 
exit;


for (var i = 0; i < ds_list_size(doorList); i++) {
	
	var inst = doorList[| i];
	with (inst) {
		if (checked) continue;
		if (oFloorManager.deep <= 0) {
			//instance_create_layer(x, y, "Instances", oWastelandWall)
			continue;
		}
		newRoom = findRoom(doorDir);
		
		if (newRoom != noone && !checked) {
			//connectRoom(self, doorDir, newRoom, other.owner);
			var request = {
				door: id,
				dir: doorDir,
				room: newRoom,
				owner: other.owner
			};
			if (irandom(100) < 75) {
				 ds_stack_push(global.roomStack, request);
			} else {
				ds_queue_enqueue(global.roomQueue, request);
			}
			checked = true;
		}
	}
}
used = true;