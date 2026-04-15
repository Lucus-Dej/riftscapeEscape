switch (buttonID) {
	case -1: // default. does nothing
	
	break;
	
	case 0:
	break;
	
	case 1: // start game
	room_goto(hordeSurvival);
	break;
	
	case 2: // settings
	break;
	
	case 3: // quit game
	game_end();
	break;
	
	case 4: // apply settings audio
	show_debug_message("trying to do music")
	editVolumeMusic();
	editVolumeSFX();
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
	
	case 6: // essence up
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