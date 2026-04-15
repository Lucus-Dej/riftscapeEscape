if ((keyboard_check_pressed(vk_escape) or unpause) && !forceUnpause) {
	unpause = false;
    pause = !pause;
    if (pause) {
		var cam = view_camera[0];
		var camW = camera_get_view_width(cam);
		var camH = camera_get_view_height(cam);
		var spacing = 128;
		var centX = camera_get_view_x(cam) + camera_get_view_width(cam) * 0.5;
		var centY = camera_get_view_y(cam) + camera_get_view_height(cam) * 0.5;
		pauseSurf = surface_create(resW, resH);
		
		resButton = instance_create_layer(centX, centY-spacing*2, "pause", oButtonLevel, {image_yscale: 2, image_xscale: 4});
		settingButton = instance_create_layer(centX, centY-spacing, "pause", oButtonLevel, {image_yscale: 2, image_xscale: 4});
		restartButton = instance_create_layer(centX, centY, "pause", oButtonLevel, {image_yscale: 2, image_xscale: 4});
		quitButton = instance_create_layer(centX, centY+spacing, "pause", oButtonLevel, {image_yscale: 2, image_xscale: 4});
		background = instance_create_layer(centX, centY, "Instances", oPauseBackground);
		

		resButton.buttonID = 11;
		resButton.drawText = "Resume Game";
		settingButton.drawText = "Settings";
		settingButton.buttonID = 12;
		quitButton.buttonID = 10;
		quitButton.drawText = "Quit Game";
		restartButton.buttonID = 9;
		restartButton.drawText = "Restart Game";
		surface_set_target(pauseSurf);
		draw_surface(application_surface, 0, 0);
		surface_reset_target();
		instance_deactivate_all(true);
		instance_activate_object(background);
		instance_activate_layer("pause");
		layer_set_visible("pause", true)
		//layer_set_visible(pauseMenu, true);
		
	} else {
        instance_activate_all();
		instance_destroy(background);
		instance_destroy(resButton);
		instance_destroy(settingButton);
		instance_destroy(restartButton);
		instance_destroy(quitButton);
		if (inSettings) {
			instance_destroy(musicSlider);
			instance_destroy(sfxSlider);
			instance_destroy(applyButton);
			instance_destroy(settingsReturnButton);
			inSettings = false;
		}
		background = noone;
        //layer_set_visible(oPauseManager.pauseMenu, false);

        if (surface_exists(pauseSurf))
            surface_free(pauseSurf);
    }
}