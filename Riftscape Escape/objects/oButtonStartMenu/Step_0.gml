var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);
var hovering = point_in_rectangle(mx, my, x - sprite_width * 0.5, y - sprite_height * 0.5, x + sprite_width * 0.5, y + sprite_height  * 0.5)
if (hovering && global.inCombat) {
	faded = true;
	image_alpha = 0.3;
} else if (hovering) {
	image_alpha = 0.5;
	faded = true;
} else if (!hovering) {
	image_alpha = 1;
}
if (display && hovering && mouse_check_button_pressed(mb_left))
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