if (instance_exists(oFloorManager)) {
	
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
	for (var i = 0; i < array_length(doorList); i++) {
		var door = doorList[i];
		with (door) {
			if (!instance_exists(childDoor)) {
				childDoor = instance_create_layer(x, y, "Instances", oBarrier)
			}
		}
	}
	if (instance_exists(oMindHusk)) {
		instance_destroy(oMindHusk);
		if (oPlayerManager.hasLifeHusk) {
			killLifeHusk = true;
		}
		oPlayerManager.huskCharge += 450;
	}
	oPlayerManager.incombat = true;
	/*if (instance_exists(workerDoor1)) {
		with (workerDoor1) {
		if (!instance_exists(childDoor)) {
				childDoor = instance_create_layer(x, y, "Instances", oBarrier)
			}
		}
	}
	if (instance_exists(workerDoor2)) {
		with (workerDoor2) {
		if (!instance_exists(childDoor)) {
				childDoor = instance_create_layer(x, y, "Instances", oBarrier)
			}
		}
	}
	*/
	global.activeRoom = true;
	event_user(2);
}
if (killLifeHusk) {
	instance_destroy(oHuskLife);
	killLifeHusk = false;
}
if (ready && !spawned && portal_timer <= 0 && !instance_exists(oFloorManager)) {
	event_user(0);
	if (totalBoss > 0) {
		pick = bossPull;
		pick.spawning = true;
		doBoss = true;
		temp_portal = instance_create_layer(pick.x, pick.y, "Instances", oBossPortal);
		audio_listener_position(temp_portal.x, temp_portal.y, 0);
		audio_play_sound_at(aPortalOpen, x, y, 0, 1, 1, 1, false, 0);
	} else {
		var i = irandom(ds_list_size(spawnerList) - 1);
		pick = spawnerList[| i];
		temp_portal = instance_create_layer(pick.x, pick.y, "Instances", oPortal);
		audio_listener_position(temp_portal.x, temp_portal.y, 0);
		audio_play_sound_at(aPortalOpen, x, y, 0, 1, 1, 1, false, 0)
	}
	spawned = true;
} else if (ready && !spawned && portal_timer <= 0 && instance_exists(oFloorManager) && diffPool > 0) {
	if (bossRoom && totalBoss > 0) {
		doBoss = true;
		pick = bossSpawner;
		temp_portal = instance_create_layer(pick.x, pick.y, "Instances", oBossPortal);
		audio_listener_position(temp_portal.x, temp_portal.y, 0);
		audio_play_sound_at(aPortalOpen, x, y, 0, 1, 1, 1, false, 0)
	} else {
		show_debug_message("I AM ROUGELIKING IT I AM ROUGELINKING IT SO GOOD")
		var f = irandom(ds_list_size(spawnerList) - 1);
		pick = spawnerList[| f];
		temp_portal = instance_create_layer(pick.x, pick.y, "Instances", oPortal);
		audio_listener_position(temp_portal.x, temp_portal.y, 0);
		audio_play_sound_at(aPortalOpen, x, y, 0, 1, 1, 1, false, 0)
		
	}
	spawned = true;
}
if (spawned == true && spawn_timer <= 0) {
	spawned = false;
	instance_destroy(temp_portal);
	temp_portal = noone;
	if (instance_exists(oFloorManager) && !doBoss) {
		event_user(4);
	} else if (instance_exists(oFloorManager) && doBoss){
		tempEnemy = bossSpawner.bossName
		totalBoss--;
	}
	 enem = instance_create_layer(pick.x, pick.y, "Instances", tempEnemy);
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
		for (var i = 0; i < array_length(doorList); i++) {
		var door = doorList[i];
		with (door) {
			if (instance_exists(childDoor)) {
				instance_destroy(childDoor);
			}
		}
	}
		
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
