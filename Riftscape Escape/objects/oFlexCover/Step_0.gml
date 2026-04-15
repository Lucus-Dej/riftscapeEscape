if (!levelApplied && currentLevel != "null") {
	switch (currentLevel) {
		case "caves":
		sprite_index = sCoverCave;
		break;
		case "desert":
		sprite_index = sDesertCover;
		break;
		case "wasteland":
		sprite_index = sCoverCave;
		break;
		case "plains":
		sprite_index = sPlainsCover;
		break;
	}
}
if (instance_exists(oFloorManager) && currentLevel == "null") {
	currentLevel = oFloorManager.floorID;
}