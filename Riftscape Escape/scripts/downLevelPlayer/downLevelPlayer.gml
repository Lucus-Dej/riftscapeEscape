function downLevelPlayer(){
	if (array_length(oPlayerManager.xpThreshdolds) > 0) {
		var lastThreshold = array_pop(oPlayerManager.xpThreshdolds);
		
		oPlayerManager.xpTotal += lastThreshold;
		oPlayerManager.xpProgress /= 1.25;
		oPlayerManager.xpLevel--;
		oPlayerManager.levelsPending--;
		
		if (oPlayerManager.levelsPending <= 0) {
			oPlayerManager.canLevel = false;
			oPlayerManager.levelsPending = 0;
		}
	}
}