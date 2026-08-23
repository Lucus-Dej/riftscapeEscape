function connectRoom(_doorConnector, _doorDir, _room, _roomOwner, _force) {
	invalid = false;
	if (spawned) return;
	
	
	if (_room == noone) return;
	var roomData = room_get_info(_room, false, true)
	var roomInstData = roomData.instances;
	var neededDoorObj = getMatchingDoorObject(_doorConnector.object_index);
	var templateDoor = noone;
	
	var roomManager = noone;
	var spawner = noone;
	var neededX = noone;
	var neededY = noone;
	// find matching door
	for (var i = 0; i < array_length(roomInstData); i++) {
		var inst = roomInstData[i];
		
		if (asset_get_index(inst.object_index) == neededDoorObj) {
			templateDoor = inst;
		}
		if (asset_get_index(inst.object_index) == oRoomClaimX) {
			neededX = inst;
		}
		if (asset_get_index(inst.object_index) == oRoomClaimY) {
			neededY = inst;
		}
	}
	
	
	// debug message error in case
	if (templateDoor == noone) {
		show_debug_message("No matching door possible");
		invalid = true;
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
	
	
	var left = min(neededX.x, neededY.x) + offsetX;
	var right = max(neededX.x, neededY.x) + offsetX;
	var top = min(neededX.y, neededY.y) + offsetY+64;
	var bottom = max(neededX.y, neededY.y) + offsetY;
	var spriteOffsetX = oRoomClaimY.sprite_width;
	var spriteOffsetY = oRoomClaimY.sprite_height;
	
	var testRange = collision_rectangle(left, top, right+spriteOffsetX, bottom+spriteOffsetY, oFlexWall, false, false);
	
	var reserveCheck = collision_rectangle(left, top, right+spriteOffsetX, bottom+spriteOffsetY, oRoomReserve, true, true);
	if ((reserveCheck != noone || testRange != noone) && !_force) {
		show_debug_message("INVALID ROOM FOUND");
		show_debug_message(reserveCheck);
		show_debug_message(testRange);
		instance_destroy(reserveCheck);
		invalid = true;
		return;
	}
	spawned = true;
	validForSpecialRoom = false;
	var claim = instance_create_layer(left, top, "Instances", oRoomReserve);
	claim.RoomID = oFloorManager.IDCount + 1;
	setClaimBounds(claim, left, top, right, bottom);
	var ritualID = 1;
	var specialRoom = false;
	if (!invalid)
	for (var i = 0; i < array_length(roomInstData); i++) {
		var inst = roomInstData[i];
		
		var obj = asset_get_index(inst.object_index);
		var parent = object_get_parent(obj)
		if ((parent == oEnemyTurrets || parent == oTurretDOTDropperDONOTUSE) && oFloorManager.floorID == "chaoslands") {
			obj = oEnemyTurretsRandSpawner;
			//newInst = instance_create_layer(inst.x + offsetX, inst.y + offsetY, "Instances", oEnemyTurretsRandSpawner, {passiveSwitch: false});
		}
		var newInst = instance_create_layer(inst.x + offsetX, inst.y + offsetY, "Instances", obj);
		newInst.RoomID = oFloorManager.IDCount +1;
		
		if (obj == oItemFlag && doorType == "item") {
			newInst.onStart = true;
		}
		if (obj == oItemFlag && doorType == "boss") {
			newInst.bossRoom = true;
		}
		
		
		if (obj == oGhostBarrier) {
			if (obj == neededDoorObj) {
				show_debug_message("I HAVE FOUND THE MATCHING DOOR")
				newInst.checked = true;
				newInst.spawned = true;
				newInst.onStart = true;
				newInst.validForSpecialRoom = false
			} else {
				newInst.validForSpecialRoom = true
			}
			newInst.RoomID = oFloorManager.IDCount +1;
			//if (doorType == "boss") newInst.state = doorState.init
		}
		if (obj == oSpawnSpawner) {
			spawner = newInst;
		}
		if (obj == oTeleSpawner) {
			newInst.con = true;
			newInst.goFloor = findNextLevel(room);
			if (room == k1) {
				if (oSettingManager.extendRun) {
					newInst.goFloor = endRuneChoiceRoom;
				}
			}
			
		}
		if (obj == oAbyss) {
			instance_destroy(newInst)
			newInst = instance_create_layer(inst.x + offsetX, inst.y + offsetY, "Items", obj);
		}
		
		if (obj == oRitualRoomSpawnMarker) {
			newInst.ID = ritualID;
			ritualID++;
		}
		if (obj == oPowerUpConflux || obj == oPurificationTable || obj == oArenaFlag || obj == oRitualRoomManager || obj == oRuneRoomFlag || obj == oItemRoomFlag) {
			specialRoom = true;	
		}
		
		
		//show_debug_message(newInst.RoomID)
	}
	roomManager = instance_create_layer(_doorConnector.x, _doorConnector.y, "Instances", oRoomManager, {RoomID: oFloorManager.IDCount + 1});
	//roomManager.RoomID = oFloorManager.IDCount + 1;
	roomManager.diffPool = oFloorManager.difficultyPool;
	roomManager.floorID = oFloorManager.floorID;
	roomManager.mask = instance_create_layer(left, top, "Flying", oRoomMask);
	roomManager.mask.RoomID = oFloorManager.IDCount + 1;
	setClaimBounds(roomManager.mask, left, top-128, right, bottom);
	if (specialRoom) {
		roomManager.specialRoom = true;
	}
	if (doorType == "item") {
		//roomManager.isChallenge = true;
	}
	if (doorType == "boss") {
		roomManager.isBossRoom = true;
	}
	if (doorType == "arena") {
		roomManager.type = roomManagerType.arena
	}
	
	
	with (spawner) {
		RoomID = roomManager.RoomID;
	}
	oFloorManager.IDCount += 1;
	spawned = true;
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

function findRoom (_sideAngle, _minDif = 0, _maxDif = 10) {
	random_get_seed()
	if (global.difficulty >= 3) {
		_maxDif+=3;
	} else if (global.difficulty == 1) {
		if (_minDif > 0) {
			_minDif -= 1;
		}
		if (_maxDif > 4) {
			_maxDif -= 1;
		}
	}
	var angle = getOppositeDoorDir(_sideAngle)
	var assetArray = [angle];
	var validPool  = tag_get_asset_ids(assetArray, asset_room)
	var filtered = [];
	for (var i = 0; i < array_length(validPool); i++) {
		var roomCheck = validPool[i];
		var tags = asset_get_tags(roomCheck);
		 if (!array_contains(tags, "conflux") && !array_contains(tags, "item") && !array_contains(tags, "pure") && !array_contains(tags, "rune") && (!array_contains(tags, "boss") && !array_contains(tags, "arena") && !array_contains(tags, "ritual"))) {
			 
			 var difficulty = -1;
			 
			 for (var j = 0; j < array_length(tags); j++) {
				 var tag = tags[j];
				 if (string_starts_with(tag, "difficulty:")) {
					 difficulty = real(string_copy(tag, 12, string_length(tag)));
					 break;
				 }
			 }
			 if (difficulty >= _minDif && difficulty <= _maxDif) {
				 array_push(filtered, roomCheck);
			 }
		 }
	}
	if (array_length(filtered) == 0) {
		return noone;
	}
	return filtered[irandom(array_length(filtered)-1)];
}
function setClaimBounds(_id, _left, _top, _right, _bottom) {
	var obj = _id;
	var offsetX = oRoomClaimY.sprite_width;
	var offsetY = oRoomClaimY.sprite_height;
    obj.left = _left;
    obj.top = _top+64;
    obj.right = _right+offsetX;
    obj.bottom = _bottom+offsetY;
    
    obj.x = obj.left;
    obj.y = obj.top;
    
    obj.image_xscale = (obj.right - obj.left);
    obj.image_yscale = (obj.bottom - obj.top);
}