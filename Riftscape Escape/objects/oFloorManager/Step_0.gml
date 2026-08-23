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
            connectRoom(id, req.dir, req.room, req.owner, false);
        }
		deep -= 1;
    }
}


if (totSize <= 0 && deep <= 0 && !done) {
	
	floorState = genState.complete;
	done = true;
} else if (totSize > 0 && deep <= 0) {
	ds_queue_clear(global.roomQueue);
	ds_stack_clear(global.roomStack);
	with (oRoomManager) {
		floorID = other.floorID;
		diffPool = other.difficultyPool;
		var request = getEnemPool(floorID)
		request.bArray = bossArray;
		request.normArray = enemArray;
		request.cArray = challengeArray;
		event_user(1);
		event_user(3);
	}
}
if (floorState == genState.complete ) {
	floorState = genState.checkingDoors;
} else if (floorState == genState.checkingDoors) {
		with (oGhostBarrierDirectionalParent) {
			var doorCheck = collision_circle(x, y, 40, oGhostBarrierDirectionalParent, false, true)
			if (doorCheck != noone) validForSpecialRoom = false;
			if (validForSpecialRoom) {
				array_push(other.bossDoorArray, id);
			}
		}
		floorState = genState.buildingSpecialRooms;
		//instance_destroy(oRoomReserve)
} else if (floorState == genState.buildingSpecialRooms) {
	
	if (global.initEvilRoom) {
		evilRoomFlag = true;
	}
	var bossFlag = false;
	var bossIndex = irandom(array_length(bossDoorArray)-1);
	var bossDoor = bossDoorArray[bossIndex];
	var dir = bossDoor.doorDir;
	var BossR = findSpecialRoom(dir, "boss");
	with (bossDoor) {
		isBossDoor = true;
		doorType = "boss";
		show_debug_message("boss door made")
		connectRoom(id, dir, BossR, Manager1, true);
		if (invalid) {
			//isBossDoor = false;
			//doorType = "null";
			instance_create_layer(x, y, "Instances", oDepictionOfSeraphim);
			for (var i = 0; i < array_length(other.bossDoorArray); i++) {
				if (!bossFlag) {
					show_debug_message("trying again: BOSS")
					var newBossDoor = other.bossDoorArray[i]; 
					bossIndex = i;
					//instance_create_layer(newBossDoor.x, newBossDoor.y, "Instances", oLightWall);
					dir = newBossDoor.doorDir;
					show_debug_message(dir)
					BossR = findSpecialRoom(dir, "boss");
					//connectRoom(id, req.dir, req.room, req.owner);
					with (newBossDoor) {
						invalid = false;
						connectRoom(id, dir, BossR, Manager1, true);
						if (!invalid) {
							isBossDoor = true;
							doorType = "boss";
							bossFlag = true;
						}
					}
					other.retryCount++;
				}
			}
		}
	}
	
	var itemFlag = false;
	var itemIndex = irandom(array_length(bossDoorArray)-1);
	while (itemIndex == bossIndex) {
		itemIndex = irandom(array_length(bossDoorArray)-1);
	}
	var itemDoor = bossDoorArray[itemIndex];
	dir = itemDoor.doorDir;
	var itemR = findSpecialRoom(dir, "item");
	
	
	with (itemDoor) {
		show_debug_message("item door made")
		doorType = "item";
		oFloorManager.challengeDoorID = id;
		connectRoom(id, dir, itemR, Manager1, false);
		
		if (invalid) {
			doorType = "null";
			//instance_create_layer(x, y, "Instances", oDepictionOfSeraphim);
			for (var i = 0; i < array_length(other.bossDoorArray); i++) {
				if (!itemFlag) {
					show_debug_message("trying again: ITEM")
					var newItemDoor = other.bossDoorArray[i]; 
					//instance_create_layer(newItemDoor.x, newItemDoor.y, "Instances", oLightWall);
					dir = newItemDoor.doorDir;
					show_debug_message(dir)
					itemR = findSpecialRoom(dir, "item");
					//connectRoom(id, req.dir, req.room, req.owner);
					with (newItemDoor) {
						oFloorManager.challengeDoorID = id;
						invalid = false;
						doorType = "item";
						connectRoom(id, dir, itemR, Manager1, false);
						if (invalid) {
							doorType = "null";
							
						} else {
							doorType = "null";
							itemFlag = true;
						}
					}
				}
			}
		} else {
			doorType = "item";
		}
		doorType = "item";
	}
	
	var ritualIndex = -1;
	var ritualCheck = irandom_range(1, 100) + global.playerTime*0.4;
	if (global.difficulty == 4) {
		ritualCheck += 10;
	}
	if (ritualCheck >= 70 || evilRoomFlag) {
		var ritualFlag = false;
		ritualIndex = irandom(array_length(bossDoorArray)-1);
		while (ritualIndex == bossIndex || ritualIndex == itemIndex) {
			ritualIndex = irandom(array_length(bossDoorArray)-1);
		}
		var ritualDoor = bossDoorArray[ritualIndex];
		dir = ritualDoor.doorDir;
		var ritualR = findSpecialRoom(dir, "ritual");
		with (ritualDoor) {
			doorType = "ritual";
			show_debug_message("ritual door made")
			connectRoom(id, dir, ritualR, Manager1, false);
			if (invalid) {
				doorType = "null";
				instance_create_layer(x, y, "Instances", oDepictionOfSeraphim);
				for (var i = 0; i < array_length(other.bossDoorArray); i++) {
					if (!ritualFlag) {
						show_debug_message("trying again: RITUAL")
						var newRitualDoor = other.bossDoorArray[i]; 
						ritualIndex = i;
						//instance_create_layer(newBossDoor.x, newBossDoor.y, "Instances", oLightWall);
						dir = newRitualDoor.doorDir;
						show_debug_message(dir)
						BossR = findSpecialRoom(dir, "ritual");
						//connectRoom(id, req.dir, req.room, req.owner);
						with (newRitualDoor) {
							invalid = false;
							connectRoom(id, dir, ritualR, Manager1, false);
							if (!invalid) {
								doorType = "ritual";
								ritualFlag = true;
							}
						}
						other.retryCount++;
					}
				}
			}
		}
	}
	
	var arenaIndex = -1;
	var arenaCheck = irandom_range(1, 100) + global.playerTime*0.4;
	if (global.difficulty == 4) {
		ritualCheck += 10;
	}
	if (arenaCheck >= 55 || evilRoomFlag) {
		var arenaFlag = false;
		arenaIndex = irandom(array_length(bossDoorArray)-1);
		while (arenaIndex == bossIndex || arenaIndex == itemIndex || arenaIndex == ritualIndex) {
			arenaIndex = irandom(array_length(bossDoorArray)-1);
		}
		var arenaDoor = bossDoorArray[arenaIndex];
		dir = arenaDoor.doorDir;
		var arenaR = findSpecialRoom(dir, "arena");
		with (arenaDoor) {
			doorType = "arena";
			show_debug_message("arena door made")
			connectRoom(id, dir, arenaR, Manager1, false);
			if (invalid) {
				doorType = "null";
				for (var i = 0; i < array_length(other.bossDoorArray); i++) {
					if (!arenaFlag) {
						show_debug_message("trying again: ARENA")
						var newArenaDoor = other.bossDoorArray[i]; 
						arenaIndex = i;
						//instance_create_layer(newBossDoor.x, newBossDoor.y, "Instances", oLightWall);
						dir = newArenaDoor.doorDir;
						show_debug_message(dir)
						BossR = findSpecialRoom(dir, "arena");
						//connectRoom(id, req.dir, req.room, req.owner);
						with (newArenaDoor) {
							doorType = "arena";
							invalid = false;
							connectRoom(id, dir, arenaR, Manager1, false);
							if (!invalid) {
								doorType = "arena";
								arenaFlag = true;
							} else {
								doorType = "null";
							}
						}
						other.retryCount++;
					}
				}
			}
		}
	}
		
	
	var runeIndex = 0;
	var runeCheck = irandom_range(1, 100) + global.playerTime*0.4 + oItemManager.dustCount;
	if (global.difficulty == 4) {
		ritualCheck += 10;
	}
	if (runeCheck >= 45 || evilRoomFlag) {
		var runeFlag = false;
		runeIndex = irandom(array_length(bossDoorArray)-1);
		while (runeIndex == bossIndex || runeIndex == itemIndex || runeIndex == ritualIndex || runeIndex = arenaIndex) {
			runeIndex = irandom(array_length(bossDoorArray)-1);
		}
		var runeDoor = bossDoorArray[runeIndex];
		dir = runeDoor.doorDir;
		var runeR = findSpecialRoom(dir, "rune");
		with (runeDoor) {
			doorType = "rune";
			show_debug_message("rune door made")
			connectRoom(id, dir, runeR, Manager1, false);
			if (invalid) {
				doorType = "null"
				for (var i = 0; i < array_length(other.bossDoorArray); i++) {
					if (!runeFlag) {
						show_debug_message("trying again: RUNE")
						var newRuneDoor = other.bossDoorArray[i]; 
						runeIndex = i;
						//instance_create_layer(newBossDoor.x, newBossDoor.y, "Instances", oLightWall);
						dir = newRuneDoor.doorDir;
						show_debug_message(dir)
						BossR = findSpecialRoom(dir, "rune");
						//connectRoom(id, req.dir, req.room, req.owner);
						with (newRuneDoor) {
							doorType = "rune";
							invalid = false;
							connectRoom(id, dir, runeR, Manager1, false);
							if (!invalid) {
								doorType = "rune";
								runeFlag = true;
							}
						}
						other.retryCount++;
					}
				}
			}
		}
	}
	
	
	var confluxIndex = 0;
	var confluxCheck = irandom_range(1, 100) + global.playerTime*0.4 + global.playerFate*0.2;
	if (global.difficulty == 4) {
		ritualCheck += 10;
	}
	if (confluxCheck >= 90 && !evilRoomFlag) {
		var confluxFlag = false;
		confluxIndex = irandom(array_length(bossDoorArray)-1);
		while (confluxIndex == bossIndex || confluxIndex == itemIndex || confluxIndex == ritualIndex || confluxIndex == arenaIndex || confluxIndex == runeIndex) {
			confluxIndex = irandom(array_length(bossDoorArray)-1);
		}
		var confluxDoor = bossDoorArray[confluxIndex];
		dir = confluxDoor.doorDir;
		var confluxR = findSpecialRoom(dir, "conflux");
		with (confluxDoor) {
			doorType = "conflux";
			show_debug_message("conflux door made")
			connectRoom(id, dir, confluxR, Manager1, false);
			if (invalid) {
				doorType = "null";
				for (var i = 0; i < array_length(other.bossDoorArray); i++) {
					if (!confluxFlag) {
						show_debug_message("trying again: conflux")
						var newconfluxDoor = other.bossDoorArray[i]; 
						confluxIndex = i;
						//instance_create_layer(newBossDoor.x, newBossDoor.y, "Instances", oLightWall);
						dir = newconfluxDoor.doorDir;
						show_debug_message(dir)
						BossR = findSpecialRoom(dir, "conflux");
						//connectRoom(id, req.dir, req.room, req.owner);
						with (newconfluxDoor) {
							doorType = "conflux";
							invalid = false;
							connectRoom(id, dir, confluxR, Manager1, false);
							if (!invalid) {
								doorType = "conflux";
								confluxFlag = true;
							}
						}
						other.retryCount++;
					}
				}
			}
		}
	}
	var pureIndex = 0;
	var pureCheck = irandom_range(1, 100) + global.playerTime*0.6;
	if (global.difficulty == 4) {
		pureCheck += 10;
	}
	if (pureCheck >= 65 && !evilRoomFlag && oItemManager.dustCount > 0) {
		var pureFlag = false;
		pureIndex = irandom(array_length(bossDoorArray)-1);
		while (pureIndex == bossIndex || pureIndex == itemIndex || pureIndex == confluxIndex || pureIndex == ritualIndex || pureIndex == arenaIndex || pureIndex == runeIndex) {
			pureIndex = irandom(array_length(bossDoorArray)-1);
		}
		var pureDoor = bossDoorArray[pureIndex];
		dir = pureDoor.doorDir;
		var pureR = findSpecialRoom(dir, "pure");
		with (pureDoor) {
			doorType = "pure";
			show_debug_message("pure door made")
			connectRoom(id, dir, pureR, Manager1, false);
			if (invalid) {
				doorType = "null";
				for (var i = 0; i < array_length(other.bossDoorArray); i++) {
					if (!pureFlag) {
						show_debug_message("trying again: pure")
						var newpureDoor = other.bossDoorArray[i]; 
						pureIndex = i;
						//instance_create_layer(newBossDoor.x, newBossDoor.y, "Instances", oLightWall);
						dir = newpureDoor.doorDir;
						show_debug_message(dir)
						BossR = findSpecialRoom(dir, "pure");
						//connectRoom(id, req.dir, req.room, req.owner);
						with (newpureDoor) {
							doorType = "pure";
							invalid = false;
							connectRoom(id, dir, pureR, Manager1, false);
							if (!invalid) {
								doorType = "pure";
								pureFlag = true;
							}
						}
						other.retryCount++;
					}
				}
			}
		}
	}
	if (evilRoomFlag) {
		evilRoomFlag = false;
		global.initEvilRoom = false;
	}
	floorState = genState.runRoomManagers;
} else if (floorState == genState.runRoomManagers) {
	activateChallengeRoom(challengeDoorID);
	with (oRoomManager) {
		if (!specialRoom) {
			array_push(other.roomManagerArray, id);
			if (!isBossRoom) {
				array_push(other.veribroseLockArray, id);
			}	
		}
		floorID = other.floorID;
		diffPool = other.difficultyPool * random_range(0.9, 1.5);
		if (global.difficulty == 1) {
			diffPool *= 0.7;
		} else if (global.difficulty >= 3) {
			diffPool *= 2;
		} 
		var request = getEnemPool(floorID)
		bossArray = request.bArray;
		enemArray = request.normArray;
		challengeArray = request.cArray;
		if (isChallenge) {
		
			show_debug_message("JUST ADDED TO THE CHALLENGE POOL OF THIS ROOM: "+string(RoomID))
			array_concat(enemArray, request.cArray);
			diffPool *= 1.25;
		}
		event_user(1);
		event_user(3);
		floorManager = other.id;
	}
	if (instance_exists(oBossStart)) {
		with (oBossStart) {
			Manager = findManager()
			var i = irandom(array_length(Manager.bossArray)-1);
			var boss = Manager.bossArray[i];
			bossName = boss;
			bossCount = 1;
			
		}
	}
	genFloor()
	instance_destroy(oRoomReserve)
	floorState = genState.done;
	show_debug_message(retryCount)
	
	with (oGhostBarrier) {
		if (doorType == "boss") {
			bossRoomID = RoomID2;
			if (oPlayerManager.hasVeribroseRune) {
				veribroseRuneLocked = true;
			}
			
		}
		if (RoomID2 == -1 && doorType == "null" && childDoor == noone) {
			var wall = instance_create_layer(x, y, "Instances", oFlexWall);
			wall.RoomID = RoomID;
			instance_destroy();
		}
	}
}
//show_debug_message(floor)