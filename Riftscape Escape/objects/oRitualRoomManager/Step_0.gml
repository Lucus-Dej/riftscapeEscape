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
}
if (instance_exists(oTruePlayer) && distance_to_object(oTruePlayer) < 320 && !gaveHint) {
	displayDuration = 240;
	disText = "Ritual Room: Defeat All Bosses To Reroll An Item Of Your Choice";
	gaveHint = true;
	with (manager) {
		global.flyGrid = mp_grid_create(claimX,claimY, (claimX2 - claimX)/ 32, (claimY2-claimY)/32, 32, 32);
	}
}
if (displayDuration > 0) {
	displayDuration--;
	displayText(disText, true);
}