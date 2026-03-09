show_debug_message("I AM EXECUTING THE BUILDING PROCESS")
for (var i = 0; i < ds_list_size(doorList); i++) {
	
	var inst = doorList[| i];
	with (inst) {
		if (checked) {
			continue;
		}
		if (oFloorManager.deep <= 0) {
			instance_create_layer(x, y, "Instances", oWastelandWall)
			continue;
		}
		newRoom = findRoom(doorDir);
		
		if (newRoom != noone) {
			connectRoom(self, doorDir, newRoom, other.owner);
			checked = true;
		}
	}
}