if (fmanager == noone) {
	with (oFloorManager) {
		show_debug_message("SEARCHING")
		other.fmanager = id;
		other.floorID = floorID;
	}
	if (fmanager != noone) {
		startBuildRoom(fmanager, id)
		var arrayUnpacker = getEnemPool(floorID)
		enemArray = arrayUnpacker.normArray;
		bossArray = arrayUnpacker.bArray;
	}
}

event_user(3);

// checks for x and y markers (needed for evil walls)
event_user(1);
