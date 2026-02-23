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
	if (instance_exists(oMindHusk)) {
		instance_destroy(oMindHusk);
		if (oPlayerManager.hasLifeHusk) {
			killLifeHusk = true;
		}
		oPlayerManager.huskCharge += 450;
	}
	if (instance_exists(workerDoor1)) {
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
	global.activeRoom = true;
	event_user(2);
}
if (killLifeHusk) {
	instance_destroy(oHuskLife);
	killLifeHusk = false;
}
if (ready && !spawned && portal_timer <= 0) {
	event_user(0);
	if (totalBoss > 0) {
		pick = bossPull;
		pick.spawning = true;
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
}
if (spawned == true && spawn_timer <= 0) {
	spawned = false;
	instance_destroy(temp_portal);
	 enem = instance_create_layer(pick.x, pick.y, "Instances", tempEnemy);
	 enem.RoomID = RoomID;
	//temp_portal = noone;
	spawn_timer = spawn_cooldown;
	portal_timer = portal_cooldown;
	inCombat = true;
}
if (inCombat && enemies <= 0) {
	ready = false;
	roomStart = false;
}

if (inCombat && !combatFinished) {
	if (!instance_exists(oEnemy) && enemies <= 0) {
		if (instance_exists(workerDoor1)) {
			if (instance_exists(workerDoor1.childDoor)) {
				show_debug_message("THIS IS A CHILD DOOR" +string(workerDoor1.childDoor));
			instance_destroy(workerDoor1.childDoor);
			}
		}
		if (instance_exists(workerDoor2)) {
			if (instance_exists(workerDoor2.childDoor)) {
				show_debug_message("THIS IS A CHILD DOOR" +string(workerDoor2.childDoor));
			instance_destroy(workerDoor2.childDoor)
			}
		}
		combatFinished = true;
		inCombat = false;
	}
}

if (global.grid_cool == false && global.activeRoom) {
	//event_user(2)
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
