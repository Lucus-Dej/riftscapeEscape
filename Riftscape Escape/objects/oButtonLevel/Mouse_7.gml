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
	}
	break;
	case 2: // life up
	if (oPlayerManager.levelsPending > 0) {
	lifeUp();
	oPlayerManager.levelsPending--;
	}
	break;
	case 3: // reality up
	if (oPlayerManager.levelsPending > 0) {
	realityUp();
	oPlayerManager.levelsPending--;
	}
	break;
	case 4: // thought up
	if (oPlayerManager.levelsPending > 0) {
	thoughtUp();
	oPlayerManager.levelsPending--;
	}
	break;
	case 5: // time up
	if (oPlayerManager.levelsPending > 0) {
	timeUp();
	oPlayerManager.levelsPending--;
	}
	break;
	case 6: // essence up
	if (oPlayerManager.levelsPending > 0) {
	essenceUp();
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
	game_restart();
	break;
	
	case 10:
	game_end();
	break;
	
	case 11:
	with (oPauseManager) {
		unpause = true;
	}
	break;
	
}