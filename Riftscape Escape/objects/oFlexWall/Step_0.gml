if (!levelApplied && currentLevel != "null") {
	switch (currentLevel) {
		case "caves":
		sprite_index = sWall;
		break;
		case "desert":
		sprite_index = sDesertWall;
		break;
		case "wasteland":
		sprite_index = sWastelandWall;
		break;
		case "plains":
		sprite_index = sPlainsBorder;
		break;
	}
}
if (instance_exists(oFloorManager) && currentLevel == "null") {
	currentLevel = oFloorManager.floorID;
}