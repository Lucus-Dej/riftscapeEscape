if (instance_exists(follow) && !oPlayerManager.inLevelMenu && !oPlayerManager.hasVeribroseRune) {
	gpu_push_state();
	gpu_set_fog(false, 0,0,0)
	if (!surface_exists(minimapSurface)) {
	    minimapSurface = surface_create(200, 200);
	}
	
	surface_set_target(minimapSurface);


	
	draw_clear_alpha(c_black, 0);

	camera_apply(minimapCam);
	if (drawInterval >= 0) {
		with (oRoomManager) {
			if ((discovered || hinted || oItemManager.hasGenStone)) {
				
				
				var len = array_length(miniMapWalls);
				for (var i = 0; i < len; i++) {
					var xPos = miniMapWalls[i].xpos;
					var yPos = miniMapWalls[i].ypos;
					var xScale = miniMapWalls[i].xscale;
					var yScale = miniMapWalls[i].yscale;
					
					if (revealFlag) {
						draw_sprite_ext(sMinimapWallFinished, 0, xPos, yPos, xScale, yScale, 0, c_white, 1);
					} else {
						draw_sprite_ext(sMinimapWall, 0, xPos, yPos, xScale, yScale, 0, c_black, 1);
					}
				}
				
				var lenD = array_length(miniMapDoors);
				for (var i = 0; i < lenD; i++) {
					var xPos = miniMapDoors[i].xpos;
					var yPos = miniMapDoors[i].ypos;
					var boss = miniMapDoors[i].boss;
					if (boss) {
						draw_sprite_ext(sMinimapBossDoor, 0, xPos, yPos, 3, 3, 0, c_white, 1);
					} else {
						draw_sprite_ext(sMinimapDoor, 0, xPos, yPos, 1, 1, 0, c_white, 1);
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
			}
		}
		with (oSuperwalls) {
			if (RoomID == -1) {
				draw_sprite_ext(sMinimapWall, 0, x, y, image_xscale, image_yscale, 0, c_white, 1);
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
				draw_sprite_ext(sRitualMinimap, 0, x, y, 8*other.scale, 8*other.scale, 0, c_white, 1);
			}
		}
		with (oArenaFlag) {
			if (RoomID == -1) {
				draw_sprite_ext(sArenaMinimap, 0, x, y, 8*other.scale, 8*other.scale, 0, c_white, 1);
			}
		}
		with (oConsumable) {
			if (object_index != oDust && object_index != oPowerUpConflux) {
				draw_sprite_ext(sPowerUpBlank, 0, x, y, 4, 4, 0, c_white, 1);
			}
		}
		if (oItemManager.hasGenStone)
		with (oEnemy) {
			draw_sprite_ext(sBossBullet, 0, x, y, 1, 1, 0, c_white, 1);
		}
		with (oPlayer) {
			draw_sprite_ext(self.sprite_index, 0, x, y, 8*other.scale, 8*other.scale, 0, c_white, 1);
		}
	} else {
		drawTimer = drawInterval;
}
	surface_reset_target();
	gpu_pop_state();
}