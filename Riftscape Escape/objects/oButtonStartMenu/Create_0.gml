click = function () {
	switch (buttonID) {
	case -1: // default. does nothing
	
	break;
	
	case 0:
	break;
	
	case 1: // queue difficulty question. 
	//room_goto(hordeSurvival);
	with (oButtonStartMenu) {
		show_debug_message("I AM TRING TO MOVE")
		instance_destroy()
	}
	with (oSlider) {
		display = false;
	}
	var diffLayer = "difficultyMenu";
	layer_set_visible(diffLayer, true);
	layer_set_visible("Assets_1", false)
	break;
	
	case 2: // settings
	break;
	
	case 3: // quit game
	endGameAndSave();
	break;
	
	case 4: // apply settings audio
	show_debug_message("trying to do music")
	editVolumeMusic();
	editVolumeSFX();
	saveGame();
	break;
	
	case 5: // return to main settings
	with (oPauseManager) {
		instance_destroy(musicSlider);
		instance_destroy(sfxSlider);
		instance_destroy(applyButton);
		instance_destroy(settingsReturnButton);
		togglePause();
	}
	
	break;
	
	case 6: // start tutorial
	room_goto(tutorial)
	break;
	
	case 7:
	break;
	
	case 8:
	break;
	
	case 9:
	break;
	
	case 10:
	break;
	
	case 11:
	break;
	}
}
faded = false;
display = true;