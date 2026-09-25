click = function () {
	switch (buttonID) {
	case -1: // default. does nothing
	
	break;
	
	case 0:
	break;
	
	case 1: // queue difficulty question. 
	//room_goto(hordeSurvival);
	with (oButtonStartMenu) {
		instance_deactivate_object(self)
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
	
	case 7: // show challenges
	with (oButtonStartMenu) {
		instance_deactivate_object(self)
	}
	if (room != startScreen) {
		instance_deactivate_object(oButtonLevel)
	}
	with (oSlider) {
		display = false;
	}
	layer_set_visible("Assets_1", false)
	for (var i = 0; i < oSettingManager.challengeMenu.challengeSize; i++) {
		var key = oSettingManager.challengeMenu.challengeKeys[i];
		var challenge = global.metaChallengeArray.challenges[$ key];
		var txt = "";
		if (global.meta.challenges[$ key]) {
		    txt = challenge.title;
		} else {
		    txt = challenge.hint;
		}
		var challengeBox = instance_create_layer(display_get_gui_width()*0.275,
		y+(i*oSettingManager.challengeMenu.challengeSpacing), "Instances", oChallengeMenuButton, 
		{buttonID: i, drawText: txt})
		
		array_push(global.metaChallengeArray.textBoxArray, challengeBox)
		
	}
	oSettingManager.drawChallenge = true;
	
	break;
	
	case 8: // return to menu
	instance_activate_object(oButtonStartMenu)
	with (oSlider) {
		display = true;
	}
	layer_set_visible("Assets_1", true)
	oSettingManager.drawChallenge = false;
	deleteChallengeMenu();
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