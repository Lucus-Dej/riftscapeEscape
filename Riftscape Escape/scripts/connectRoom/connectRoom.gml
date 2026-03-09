function connectRoom(_doorConnector, _doorDir, _room, _roomOwner) {
	if (checked) {
		return;
	}
	if (_room == noone) return;
	var roomData = room_get_info(_room, false, true)
	var roomInstData = roomData.instances;
	
	var neededDoorObj = getMatchingDoorObject(_doorConnector.object_index);
	var templateDoor = noone;
	
	var roomManager = noone;
	var spawner = noone;
	
	// find matching door
	for (var i = 0; i < array_length(roomInstData); i++) {
		var inst = roomInstData[i];
		
		if (asset_get_index(inst.object_index) == neededDoorObj) {
			
			templateDoor = inst;
			templateDoor.checked = true;
			show_debug_message("MY ORIGIN IS")
			show_debug_message(templateDoor)
			break;
		}
	}
	
	// debug message error in case
	if (templateDoor == noone) {
		show_debug_message("No matching door possible");
		return;
	}
	var sep = oGhostBarrier.sprite_width;
	
	var offsetX = _doorConnector.x - templateDoor.x;
	var offsetY = _doorConnector.y - templateDoor.y;
	
	switch (_doorConnector.object_index) {
		case oGhostBarrierRight: 
		offsetX += sep; 
		
		break;
		
		case oGhostBarrierLeft:
		offsetX -= sep;
		break;
		
		case oGhostBarrierUp:
		offsetY -= sep;
		break;
		
		case oGhostBarrierDown:
		offsetY += sep;
		break;
	}
	
	for (var i = 0; i < array_length(roomInstData); i++) {
		var inst = roomInstData[i];
		
		var obj = asset_get_index(inst.object_index);
		
		
		var newInst = instance_create_layer(inst.x + offsetX, inst.y + offsetY, "Instances", obj);
		newInst.RoomID = oFloorManager.IDCount +1;
		if (newInst == oStartRoom) {
			spawner = newInst;
		}
		if (newInst == templateDoor) {
			templateDoor.checked = true;
		}
		//show_debug_message(newInst.RoomID)
	}
	roomManager = instance_create_layer(_doorConnector.x, _doorConnector.y, "Instances", oRoomManager);
	roomManager.RoomID = oFloorManager.IDCount + 1;
	
	with (spawner) {
		RoomID = roomManager.RoomID;
	}
	with (roomManager) {
		event_user(3);
		event_user(1);
	}
	oFloorManager.IDCount += 1;
	if (oFloorManager.deep > 0 && roomManager != noone) {
		builder = instance_create_layer(roomManager.x,roomManager.y, "Instances", oRoomBuilder);
		oFloorManager.deep -= 1;
	}
}

function getMatchingDoorObject(_doorObj) {
    switch (_doorObj) {
        case oGhostBarrierRight: 
		return oGhostBarrierLeft;
		
        case oGhostBarrierLeft:  
		return oGhostBarrierRight;
		
        case oGhostBarrierUp:    
		return oGhostBarrierDown;
		
        case oGhostBarrierDown:  
		return oGhostBarrierUp;
    }
    return noone;
}
function getOppositeDoorDir (_dir) {
	switch (_dir) {
		
		case "left":
		return "right";
		
		case "right":
		return "left";
		
		case "up":
		return "down";
		
		case "down":
		return "up";
	}
}

function findRoom (_sideAngle) {
	random_get_seed()
	var angle = getOppositeDoorDir(_sideAngle)
	var validPool  = tag_get_asset_ids(angle, asset_room)
	if (array_length(validPool) == 0) {
		return noone;
	}
	show_debug_message(validPool)
	return validPool[irandom(array_length(validPool)-1)];
}