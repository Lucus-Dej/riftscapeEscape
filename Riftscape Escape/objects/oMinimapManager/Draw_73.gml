if (instance_exists(follow) && !oPlayerManager.inLevelMenu) {

	if (!surface_exists(minimapSurface)) {
	    minimapSurface = surface_create(200, 200);
	}

	surface_set_target(minimapSurface);
	draw_clear_alpha(c_black, 0);

	camera_apply(minimapCam);
	with (oRoomManager) {
		if ((discovered || hinted || oItemManager.hasGenStone)) {
			//draw_self();
			if (combatFinished) {
				with (oSuperwalls) {
					if (RoomID == other.RoomID) {
						draw_sprite_ext(sMinimapWallFinished, 0, x, y, 1, 1, 0, c_white, 1);
					}
				}
			} else {
				with (oSuperwalls) {
					if (RoomID == other.RoomID) {
						draw_sprite_ext(sMinimapWall, 0, x, y, 1, 1, 0, c_black, 1);
					}
				}
			}
			
			with (oItems) {
				if (RoomID == other.RoomID) {
					draw_sprite_ext(sMinimapItem, 0, x, y, 3, 3, 0, c_white, 1);
				}
			}
			with (oRuneRoomFlag) {
				if (RoomID == other.RoomID) {
					draw_sprite_ext(sBlankRune, 0, x, y, 8, 8, 0, c_white, 1);
				}
			}
			with (oRitualRoomManager) {
				if (RoomID == other.RoomID) {
					draw_sprite_ext(sRitualMinimap, 0, x, y, 8, 8, 0, c_white, 1);
				}
			}
			with (oArenaFlag) {
				if (RoomID == other.RoomID) {
					draw_sprite_ext(sArenaMinimap, 0, x, y, 8, 8, 0, c_white, 1);
				}
			}
			with (oGhostBarrierDirectionalParent) {
				if (doorType == "boss" && RoomID1 == other.RoomID && instance_exists(oFloorManager)) {
					draw_sprite_ext(sMinimapBossDoor, 0, x, y, 3, 3, 0, c_white, 1);
				} else if (RoomID1 == other.RoomID) {
					draw_sprite_ext(sMinimapDoor, 0, x, y, 1, 1, 0, c_white, 1);
				}
			}
		}
	}
	with (oSuperwalls) {
		if (RoomID == -1) {
			//draw_sprite_ext(sMinimapWall, 0, x, y, 1, 1, 0, c_white, 1);
		}
		
	}
	with (oItems) {
		if (RoomID == -1) {
			draw_sprite_ext(sMinimapItem, 0, x, y, 3, 3, 0, c_white, 1);
		}
	}
	with (oRuneRoomFlag) {
		if (RoomID == -1) {
			draw_sprite_ext(sBlankRune, 0, x, y, 8, 8, 0, c_white, 1);
		}
		
	}
	with (oRitualRoomManager) {
		if (RoomID == -1) {
			draw_sprite_ext(sRitualMinimap, 0, x, y, 8, 8, 0, c_white, 1);
		}
	}
	with (oArenaFlag) {
		if (RoomID == -1) {
			draw_sprite_ext(sArenaMinimap, 0, x, y, 8, 8, 0, c_white, 1);
		}
	}
	
	if (oItemManager.hasGenStone)
	with (oEnemy) {
		draw_sprite_ext(sBossBullet, 0, x, y, 1, 1, 0, c_white, 1);
	}
	with (oPlayer) draw_self();

	surface_reset_target();
}