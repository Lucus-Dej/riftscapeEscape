function togglePause() {
	if (!oPauseManager.inSettings) {
		instance_deactivate_object(oPauseManager.settingButton);
		instance_deactivate_object(oPauseManager.resButton);
		instance_deactivate_object(oPauseManager.restartButton);
		instance_deactivate_object(oPauseManager.quitButton);
		//layer_set_visible("pause", false);
	} else {
		oPauseManager.inSettings = false;
		instance_activate_object(oPauseManager.settingButton);
		instance_activate_object(oPauseManager.resButton);
		instance_activate_object(oPauseManager.restartButton);
		instance_activate_object(oPauseManager.quitButton);
		layer_set_visible("pause", true);
	}
	//create background
	
	
	// create buttons
	
}
function callSettings() {
	oPauseManager.inSettings = true;
	var cam = view_camera[0];
	var camW = camera_get_view_width(cam);
	var camH = camera_get_view_height(cam);
	var spacing = 64;
	var centX = camera_get_view_x(cam) + camera_get_view_width(cam) * 0.5;
	var centY = camera_get_view_y(cam) + camera_get_view_height(cam) * 0.5;
	
	draw_set_colour(c_white);
	draw_set_font(fLevels);
	
	oPauseManager.settingsReturnButton = instance_create_layer(centX, centY, "pause", oButtonStartMenu, {image_yscale: 2, image_xscale: 4});
	oPauseManager.settingsReturnButton.drawText = "Return";
	oPauseManager.settingsReturnButton.buttonID = 5;
	
	oPauseManager.musicSlider = instance_create_layer(centX+camW*0.1, centY-spacing, "pause", oSlider, {controlsMusic: true, image_xscale: 1.375});
	oPauseManager.musicSlider.drawText = "Music Audio:";
	

	oPauseManager.sfxSlider = instance_create_layer(centX+camW*0.1, centY+spacing, "pause", oSlider, {controlsSFX: true, image_xscale: 1.375});
	oPauseManager.sfxSlider.drawText = "SFX Audio:";
	
	oPauseManager.applyButton = instance_create_layer(oPauseManager.sfxSlider.x+oPauseManager.sfxSlider.sprite_width/2, centY+spacing*2.5, "pause", oButtonStartMenu, {image_yscale: 1.75, image_xscale: 3});
	oPauseManager.applyButton.drawText = "Apply";
	oPauseManager.applyButton.buttonID = 4;
	
	
}