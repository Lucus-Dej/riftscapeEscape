switch (buttonID) {
	case -1: // default. does nothing
	
	break;
	
	case 0:
	layer_set_visible(oPlayerManager.levelMenuLayer, false)
	oPlayerManager.inLevelMenu = false;
	layer_set_visible(oPlayerManager.tokenMenuLayer, true)
	oPlayerManager.inTokenMenu = true;
	break;
	
	case 1: // fate up
	if (oPlayerManager.levelsPending > 0) {
	fateUp();
	oPlayerManager.levelsPending--;
	oPlayerManager.fateLeveled++;
	}
	break;
	case 2: // life up
	if (oPlayerManager.levelsPending > 0) {
	lifeUp();
	oPlayerManager.levelsPending--;
	oPlayerManager.lifeLeveled++;
	}
	break;
	case 3: // reality up
	if (oPlayerManager.levelsPending > 0) {
	realityUp();
	oPlayerManager.levelsPending--;
	oPlayerManager.realityLeveled++;
	}
	break;
	case 4: // thought up
	if (oPlayerManager.levelsPending > 0) {
	thoughtUp();
	oPlayerManager.thoughtLeveled++;
	oPlayerManager.levelsPending--;
	}
	break;
	case 5: // time up
	if (oPlayerManager.levelsPending > 0) {
	timeUp();
	oPlayerManager.levelsPending--;
	oPlayerManager.timeLeveled++;
	}
	break;
	case 6: // essence up
	if (oPlayerManager.levelsPending > 0) {
	essenceUp();
	oPlayerManager.essenceLeveled++;
	oPlayerManager.levelsPending--;
	}
	break;
	case 7:
	layer_set_visible(oPlayerManager.levelMenuLayer, true)
	oPlayerManager.inLevelMenu = true;
	layer_set_visible(oPlayerManager.tokenMenuLayer, false)
	oPlayerManager.inTokenMenu = false;
	
	break;
	case 8:
	layer_set_visible(oPlayerManager.tokenMenuLayer, false)
	oPlayerManager.inTokenMenu = false;
	layer_set_visible(oPlayerManager.levelMenuLayer, false)
	oPlayerManager.inLevelMenu = false;
	break;
	
	case 9:
	saveGame();
	game_restart();
	loadGame();
	break;
	
	case 10:
	endGameAndSave();
	break;
	
	case 11:
	with (oPauseManager) {
		unpause = true;
	}
	break;
	
	case 12:

	togglePause();
	
	callSettings();
	break;
	
	case 14:
	room_goto(hordeSurvival);
	var diffLayer = "difficultyMenu";
	layer_set_visible(diffLayer, false);
	if (global.difficulty == 4) {
		oSettingManager.queueEvilRuneAdd = true;
	}
	break;
	
	
	case 15: // set to easy difficulty;
	global.difficulty = 1;
	break;
	
	case 16: // set to normal difficulty;
	global.difficulty = 2;
	break;
	
	case 17: // set to hard difficulty;
	global.difficulty = 3;
	break;
	
	case 18: // set to extreme difficulty;
	global.difficulty = 4;
	break;
}