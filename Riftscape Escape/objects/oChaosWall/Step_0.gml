if (!levelApplied) {
	var i = irandom(5);
	if (i == 5) {
		var ranArray = [sWall, sDesertWall, sWastelandWall, sPlainsBorder, sKingdomWalls, sLightWall, sWastelandWallEvil, sKingdomWallsEvil];
		var index = irandom(array_length(ranArray)-1);
		sprite_index = ranArray[index];
	} else {
		sprite_index = sChaosWalls;
	}
	levelApplied = true;
}
if (currentLevel == "null" && instance_exists(oFloorManager)) {
	currentLevel = oFloorManager.floorID;
}