function initConflux(){
	
	var levelArray = [oPlayerManager.fateLeveled, oPlayerManager.lifeLeveled, 
		oPlayerManager.timeLeveled, oPlayerManager.essenceLeveled, 
		oPlayerManager.thoughtLeveled, oPlayerManager.realityLeveled];
	var levelPenatly = oPlayerManager.confluxCost;
	oPlayerManager.confluxCost += 2;
	// reset all leveled stats down to zero
	for (var i = 0; i < array_length(levelArray); i++) {
		var stat = levelArray[i];
		for (var f = 0; f < stat; f++) {
			switch (i) {
				case 0:
				fateDown();
				oPlayerManager.fateLeveled--;
				oPlayerManager.levelsPending++;
				break;
				
				case 1:
				lifeDown();
				oPlayerManager.lifeLeveled--;
				oPlayerManager.levelsPending++;
				break;
				
				case 2:
				timeDown();
				oPlayerManager.timeLeveled--;
				oPlayerManager.levelsPending++;
				break;
				
				case 3:
				essenceDown();
				oPlayerManager.essenceLeveled--;
				oPlayerManager.levelsPending++;
				break;
				
				case 4:
				thoughtDown();
				oPlayerManager.thoughtLeveled--;
				oPlayerManager.levelsPending++;
				break;
				
				case 5:
				realityDown();
				oPlayerManager.realityLeveled--;
				oPlayerManager.levelsPending++;
				break;
				
				
			}
			
		}
	}
	layer_set_visible(oPlayerManager.levelMenuLayer, true);
	with (oLevelChoiceLeft) {
		hasChosen = false;
		valid = true;
		levelMet = false;
	}
	with (oLevelChoiceRight) {
		hasChosen = false;
		valid = true;
		levelMet = false;
	}
	layer_set_visible(oPlayerManager.levelMenuLayer, false);
	layer_set_visible(oPlayerManager.tokenMenuLayer, true);
	with oPlayerManager {
		event_user(0);
	}
	
	
	with oUpgradeTokenReal {
		upgradeSpent = false;
		spent = false;
		valid = true;
		image_index = 0;
	}
	with oUpgradeTokenStatic {
		image_index = 0;
	}
	
	layer_set_visible(oPlayerManager.tokenMenuLayer, false);
	//level penalty
	for (var r = 0; r < levelPenatly; r++) {
		if (oPlayerManager.levelsPending > 0)
		oPlayerManager.levelsPending--;
	}
	//room restart
	var currentRoom = room;
	room_goto(room)
	
	
}