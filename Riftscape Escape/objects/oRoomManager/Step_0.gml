if (instance_exists(oFloorManager)) {
	isFloorGen = true;
} else {
	isFloorGen = false;
}
if (!discovered && instance_exists(workerX)) {
	with (oTruePlayer) {
		if (x > other.workerX.x && x < other. workerY.x && y > other.workerX.y && y < other.workerY.y) {
			other.discovered = true;
		}
	}
}
if (type == roomManagerType.arena && !wavebasedSpawned) {
	waveManager = instance_create_layer(x, y, "Instances", oWavebasedManager);
	waveManager.RoomID = RoomID;
	waveManager.isLimited = true;
	waveManager.waveLimit = 5;
	waveManager.roundsTillBoss = 4;
	waveManager.restrictedArrays = true;
	waveManager.startingWeight = diffPool+2;
	with (oEnemyTurrets) {
		if (RoomID == other.RoomID) {
			passiveSwitch = false;
			levelReq = irandom_range(2, 4);//other.wavebasedAddTurret;
		}
	}
	array_copy(waveManager.waveArray, 0, enemArray, 0, array_length(enemArray));
	wavebasedSpawned = true;
	waveManager.manager = id;
}
if (type == roomManagerType.arena && instance_exists(waveManager) && waveManager.wave == wavebasedAddChallenge && !addedChallenge) {
	var temp = getEnemPool(floorID);
	var startIndex = array_length(waveManager.waveArray);
	for (var i = 0; i < array_length(temp.cArray); i++) {
		waveManager.waveArray[startIndex + i] = temp.cArray[i];
	}
	waveManager.startingWeight *= 2;
	addedChallenge = true;
}
// checks if boss exists, changing count logic if so
hasBoss = (instance_exists(workerBossSpawners));
// timers
if (portal_timer >= 0 && ready && !combatFinished) {
	portal_timer--;
}
if (portal_timer <= 0) {
	spawn_timer--;
}
if (roomStart && !ready) {
	if (oItemManager.hasReflectiveGem) {
		oItemManager.reflectiveGemFlag = true;
	}
	with (oReverseTrappedSpikes) {
		if (RoomID == other.RoomID) {
			active = true;
			image_index = 1;
		}
	}
	with (oAlternatingSpikes) {
		if (RoomID == other.RoomID) {
			active = true;
			image_index = 1;
		}
	}
	ready = true;
	powerDoor(RoomID, true)
	if (oPlayerManager.hasItemDenyRune) {
		show_debug_message("RUNNING VIRST STUFF")
		virstItemDeny();
		virstItemDeny();
	}
	
	// destory husk if it exists
	if (instance_exists(oMindHusk)) {
		instance_destroy(oMindHusk);
		if (oPlayerManager.hasLifeHusk) {
			killLifeHusk = true;
		}
		oPlayerManager.huskCharge += 450;
		instance_destroy(oHuskLife);
	}
	oPlayerManager.incombat = true;
	
	global.activeRoom = true;
	event_user(2);
}
	
	
if (ready && !spawned && portal_timer <= 0 && !isFloorGen) {
	event_user(0);
	if (totalBoss > 0) {
		pick = bossPull;
		pick.spawning = true;
		doBoss = true;
	} else {
		var i = irandom(ds_list_size(spawnerList) - 1);
		pick = spawnerList[| i];
	}
	spawned = true;
} else if (ready && !spawned && portal_timer <= 0 && isFloorGen && diffPool > 0) {
	if (bossRoom && totalBoss > 0) {
		doBoss = true;
		pick = bossSpawner;
		//temp_portal = instance_create_layer(pick.x, pick.y, "Instances", oBossPortal);
	} else {
		var f = irandom(ds_list_size(spawnerList) - 1);
		pick = spawnerList[| f];
		//temp_portal = instance_create_layer(pick.x, pick.y, "Instances", oPortal);
		
		
	}
	spawned = true;
}
if (spawned == true && spawn_timer <= 0) {
	spawned = false;
	//instance_destroy(temp_portal);
	//temp_portal = noone;
	if (isFloorGen && !doBoss) {
		event_user(4);
	} else if (isFloorGen && doBoss){
		tempEnemy = bossSpawner.bossName
		totalBoss--;
	}
	if (global.difficulty == 1) {
		enem = spawnEnemViaEgg(24, tempEnemy, doBoss, isChallenge, RoomID, id, pick)
	} else if (global.difficulty == 2 ) {
		enem = spawnEnemViaEgg(12, tempEnemy, doBoss, isChallenge, RoomID, id, pick)
	} else if (global.difficulty >= 3) {
		enem = spawnEnemViaEgg(6, tempEnemy, doBoss, isChallenge, RoomID, id, pick)
	}
	
	//enem = instance_create_layer(pick.x, pick.y, "Instances", tempEnemy);
	//enem.RoomID = RoomID;
	//enem.Manager = id;
	 //if (isChallenge) {
	//	enem.xp *= 1.2; 
	 //}
	 if (doBoss) {
		 doBoss = false;
	 }
	// diffPool -= enem;
	//temp_portal = noone;
	spawn_timer = spawn_cooldown;
	portal_timer = portal_cooldown;
	inCombat = true;
}
if (inCombat && enemies <= 0 && !instance_exists(oFloorManager)) {
	ready = false;
	roomStart = false;
} else if (instance_exists(oFloorManager) && inCombat && diffPool <= 0) {
	ready = false;
	roomStart = false;
}

if (inCombat && !combatFinished && temp_portal == noone) {
	if ((!instance_exists(oEnemy) && enemies <= 0 && diffPool <= 0) || (instance_exists(oFloorManager) && diffPool <= 0 && !instance_exists(oEnemy) && !instance_exists(oEnemPortalEgg))) {
		unpowerDoor(RoomID)
		endOfCombatCheck()
		if (oPlayerManager.hasItemDenyRune) {
			virstItemAdd();
			virstItemAdd();
		}
		powerTorzol();
		with (oGhostBarrier) {
			if (RoomID == other.RoomID) {
				revealNearbyRooms(id)
			}
		}
	with (oReverseTrappedSpikes) {
		if (RoomID == other.RoomID) {
			active = false;
			image_index = 0;
		}
	}
	with (oReverseTrappedSpikes) {
		if (RoomID == other.RoomID) {
			active = false;
			swap = false;
			image_index = 0;
		}
	}
		global.activeRoom = false;
		combatFinished = true;
		revealFlag = true;
		inCombat = false;
		oPlayerManager.incombat = false;
		
		if (instance_exists(floorManager)) {
			with (floorManager) {
				event_user(0);
			}
			if (!floorManager.floorCompleteFlag) {
				rollConsumable(spawner);
			} else {
				var floorClearReward = irandom_range(1, 4);
				switch (floorClearReward) {
					case 1:
					instance_create_layer(spawner.x, spawner.y, "Instances", oPowerUpHPHigh);
					break;
					case 2:
					instance_create_layer(spawner.x, spawner.y, "Instances", oPowerUpLuckHigh);
					break;
					case 3:
					instance_create_layer(spawner.x, spawner.y, "Instances", oPowerUpHPHigh);
					break;
					case 4:
					var funCheck = irandom_range(1, 50) + global.playerTime;
					if (funCheck >= 50) {
						var item = rollItem(false, itemSearchType.simple);
						instance_create_layer(spawner.x, spawner.y, "Instances", item);
					} else {
						var i = rollItem(false);
						instance_create_layer(spawner.x, spawner.y, "Instances", i);
					}
					break;
				}
			}
		} else {
			rollConsumable(spawner);
		}
		//audio_play_sound(aRoomClear, 1, false, global.sfxAudio);
		if (global.chargeItem != noone && global.currentCharges < global.itemCharges) {
			global.currentCharges += 1;
		}
		
	}
} else if (inCombat && !combatFinished && buffer > 0) {
	buffer--;
}


// destroys any evil walls if they are in the room
if (destroyWalls) {
	event_user(1)
	for (var i = 0; i < ds_list_size(evilWallList); i++) {
    var w = evilWallList[| i];
	if (instance_exists(w)) {
		instance_create_layer(x, y, "Instances", oBoom)
		instance_destroy(w);
		}
	}
	event_user(2);
	destroyWalls = false;
	ds_list_clear(evilWallList);
	ds_list_destroy(evilWallList);
}
