if (instance_exists(follow)) {

	if (!surface_exists(minimapSurface)) {
	    minimapSurface = surface_create(200, 200);
	}

	surface_set_target(minimapSurface);
	draw_clear_alpha(c_black, 0);

	camera_apply(minimapCam);

	with (oSuperwalls) {
		draw_sprite_ext(sMinimapWall, 0, x, y, 1, 1, 0, c_white, 1);
	}
	with (oItems) {
		draw_sprite_ext(sMinimapItem, 0, x, y, 3, 3, 0, c_white, 1);
	}
	with (oGhostBarrierDirectionalParent) {
		if (doorType == "boss") {
			draw_sprite_ext(sMinimapBossDoor, 0, x, y, 3, 3, 0, c_white, 1);
		} else {
			draw_sprite_ext(sMinimapDoor, 0, x, y, 1, 1, 0, c_white, 1);
		}
	}
	if (oItemManager.hasGenStone)
	with (oEnemy) {
		draw_sprite_ext(sBossBullet, 0, x, y, 1, 1, 0, c_white, 1);
	}
	with (oPlayer) draw_self();

	surface_reset_target();
}