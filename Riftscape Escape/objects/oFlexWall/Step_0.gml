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
		case "kingdom":
		sprite_index = sKingdomWalls;
		break;
	}
}
if (currentLevel == "null" && instance_exists(oFloorManager)) {
	currentLevel = oFloorManager.floorID;
}