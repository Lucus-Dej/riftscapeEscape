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
		case "kingdom":
		sprite_index = sKingdomCover;
		break;
		case "plains":
		sprite_index = sPlainsCover;
		break;
		case "chaoslands":
		var i = irandom(5);
		if (i != 5) {
			var ranArray = [sCoverCave, sDesertCover, sKingdomCover, sPlainsCover];
			var index = irandom(array_length(ranArray)-1);
			sprite_index = ranArray[index];
		} else {
			sprite_index = sChaosCover;
		}
		break;
	}
	levelApplied = true;
}
if (instance_exists(oFloorManager) && currentLevel == "null") {
	currentLevel = oFloorManager.floorID;
}