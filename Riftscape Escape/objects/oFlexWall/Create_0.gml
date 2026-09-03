event_inherited();
currentLevel = "null";
levelApplied = false;
levelInit = false;
setTile = function() {
	if (instance_exists(oFloorManager)) {
		currentLevel = oFloorManager.floorID;
	}
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
		case "library":
		sprite_index = sLibraryWalls;
		break;
		case "shadow":
		sprite_index = sShadowscapeWall;
		break;
		case "chaoslands":
		var i = irandom(5);
		if (i != 5) {
			var ranArray = [sLibraryWalls, sWall, sDesertWall, sWastelandWall, sPlainsBorder, sKingdomWalls, sLightWall, sWastelandWallEvil, sKingdomWallsEvil];
			var index = irandom(array_length(ranArray)-1);
			sprite_index = ranArray[index];
		} else {
			sprite_index = sChaosWalls;
		}
		
		break;
	}
}