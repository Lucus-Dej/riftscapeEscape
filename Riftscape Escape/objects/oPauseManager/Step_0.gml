if ((keyboard_check_pressed(vk_escape) or unpause) && !forceUnpause) {
	unpause = false;
    pause = !pause;

    if (pause) {
        pauseSurf = surface_create(resW, resH);

        surface_set_target(pauseSurf);
        draw_surface(application_surface, 0, 0);
        surface_reset_target();

        instance_deactivate_all(true);

        layer_set_visible(pauseMenu, true);
	} else {
        instance_activate_all();

        layer_set_visible(oPauseManager.pauseMenu, false);

        if (surface_exists(pauseSurf))
            surface_free(pauseSurf);
    }
}