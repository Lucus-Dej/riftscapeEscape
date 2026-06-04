if (instance_exists(oFloorManager)) {
	isFloorGen = true;
} else {
	isFloorGen = false;
}
if (!discovered && instance_exists(workerX)) {
	with (oTruePlayer) {
		if (x > other.claimX && x < other.claimX2 && y > other.claimY && y < other.claimY2) {
			other.discovered = true;
		}
	}
}
if (type == roomManagerType.arena && !wavebasedSpawned) {
	waveManager = instance_create_layer(x, y, "Instances", oWavebasedManager);
	waveManager.RoomID = RoomID;
	waveManager.isLimited = true;
	waveManager.waveLimit = 7;
	waveManager.roundsTillBoss = 6;
	waveManager.restrictedArrays = true;
	waveManager.startingWeight = diffPool+2;
	array_copy(waveManager.waveArray, 0, enemArray, 0, array_length(enemArray));
	wavebasedSpawned = true;
}
if (type == roomManagerType.arena && instance_exists(waveManager) && waveManager.wave == wavebasedAddChallenge && !addedChallenge) {
	show_debug_message("HELP")
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
	ready = true;
	// lock down rooms
	with (oGhostBarrierDirectionalParent) {
		if (RoomID == other.RoomID) {
			if (!instance_exists(childDoor)) {
				childDoor = instance_create_layer(x, y, "Instances", oBarrier)
			}
		}
	}
	// destory husk if it exists
	if (instance_exists(oMindHusk)) {
		instance_destroy(oMindHusk);
		if (oPlayerManager.hasLifeHusk) {
			killLifeHusk = true;
		}
		oPlayerManager.huskCharge += 450;
	}
	oPlayerManager.incombat = true;
	
	global.activeRoom = true;
	event_user(2);
}
if (killLifeHusk) {
	instance_destroy(oHuskLife);
	killLifeHusk = false;
}
if (ready && !spawned && portal_timer <= 0 && !isFloorGen) {
	event_user(0);
	if (totalBoss > 0) {
		pick = bossPull;
		pick.spawning = true;
		doBoss = true;
		temp_portal = instance_create_layer(pick.x, pick.y, "Instances", oBossPortal);
		audio_listener_position(temp_portal.x, temp_portal.y, 0);
		audio_play_sound_at(aPortalOpen, x, y, 0, 1, 1, 1, false, 0, global.sfxAudio);
	} else {
		var i = irandom(ds_list_size(spawnerList) - 1);
		pick = spawnerList[| i];
		temp_portal = instance_create_layer(pick.x, pick.y, "Instances", oPortal);
		audio_listener_position(temp_portal.x, temp_portal.y, 0);
		audio_play_sound_at(aPortalOpen, x, y, 0, 1, 1, 1, false, 0, global.sfxAudio)
	}
	spawned = true;
} else if (ready && !spawned && portal_timer <= 0 && isFloorGen && diffPool > 0) {
	if (bossRoom && totalBoss > 0) {
		doBoss = true;
		pick = bossSpawner;
		temp_portal = instance_create_layer(pick.x, pick.y, "Instances", oBossPortal);
		audio_listener_position(temp_portal.x, temp_portal.y, 0);
		audio_play_sound_at(aPortalOpen, x, y, 0, 1, 1, 1, false, 0, global.sfxAudio)
	} else {
		var f = irandom(ds_list_size(spawnerList) - 1);
		pick = spawnerList[| f];
		temp_portal = instance_create_layer(pick.x, pick.y, "Instances", oPortal);
		audio_listener_position(temp_portal.x, temp_portal.y, 0);
		audio_play_sound_at(aPortalOpen, x, y, 0, 1, 1, 1, false, 0, global.sfxAudio)
		
	}
	spawned = true;
}
if (spawned == true && spawn_timer <= 0) {
	spawned = false;
	instance_destroy(temp_portal);
	temp_portal = noone;
	if (isFloorGen && !doBoss) {
		event_user(4);
	} else if (isFloorGen && doBoss){
		tempEnemy = bossSpawner.bossName
		totalBoss--;
	}
	 enem = instance_create_layer(pick.x, pick.y, "Instances", tempEnemy);
	 enem.RoomID = RoomID;
	 enem.Manager = id;
	 if (isChallenge) {
		enem.xp *= 1.2; 
	 }
	 if (doBoss) {
		 with (enem) {
			 isBoss = true;
			 xp *= 1.5;
			 bossMod(id);
			 //event_user(13)
		 }
		 doBoss = false;
	 }
	 enem.RoomID = RoomID;
	 diffPool -= enem.spawnWeight;
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
	if ((!instance_exists(oEnemy) && enemies <= 0) || (instance_exists(oFloorManager) && !instance_exists(oEnemy))) {
		with (oGhostBarrierDirectionalParent) {
		if ((RoomID1 == other.RoomID) || (RoomID2 == other.RoomID)) {
			if (instance_exists(Manager2)){
				Manager2.hinted = true;
			}
			if (!instance_exists(childDoor)) {
				childDoor = instance_create_layer(x, y, "Instances", oBarrier)
			}
		}
	}
		global.activeRoom = false;
		combatFinished = true;
		inCombat = false;
		oPlayerManager.incombat = false;
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
		show_debug_message("THISISANEVILWALL" +string(w));
		instance_destroy(w);
		}
	}
	event_user(2);
	destroyWalls = false;
	ds_list_clear(evilWallList);
	ds_list_destroy(evilWallList);
}
