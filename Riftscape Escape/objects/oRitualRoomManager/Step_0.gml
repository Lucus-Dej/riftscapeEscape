if (manager == noone) {
	with (oRoomManager) {
		if (RoomID == other.RoomID) {
			other.manager = id;
		}
	}
}
if (array_length(spawnArray) >= 3 && !instance_exists(oEnemy) && !finished) {
	oItemManager.ritualRerollAvailable = true;
	displayDuration = 240;
	disText = "Click An Item In Your Inventory To Reroll It";
	finished = true;
	unpowerDoor(RoomID);
	endOfCombatCheck()
	powerTorzol();
	with (oGhostBarrier) {
		if (RoomID == other.RoomID) {
			revealNearbyRooms(id);
		}
	}
}
if (instance_exists(oTruePlayer) && distance_to_object(oTruePlayer) < 320 && !gaveHint) {
	displayDuration = 240;
	disText = "Ritual Room: Defeat All Bosses To Reroll An Item Of Your Choice";
	gaveHint = true;
	with (manager) {
		event_user(2);
	}
}
if (displayDuration > 0) {
	displayDuration--;
	displayText(disText, true);
}