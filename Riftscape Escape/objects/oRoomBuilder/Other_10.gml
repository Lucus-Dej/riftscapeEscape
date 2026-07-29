if (oFloorManager.deep <= 0) 
exit;


if(ds_queue_size(doorQueue) > 0) {
	var inst = ds_queue_head(doorQueue);
	ds_queue_dequeue(doorQueue);
	with (inst) {
		if (oFloorManager.deep <= 0) {
			//instance_create_layer(x, y, "Instances", oWastelandWall)
			continue;
		}
		newRoom = findRoom(doorDir);
		
		if (newRoom != noone) {
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
		}
	}
}