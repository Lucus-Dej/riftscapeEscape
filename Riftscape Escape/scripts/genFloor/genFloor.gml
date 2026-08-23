function genFloor(){
	var centArray = [];
	var cellSize = 32;
	var tilemap = layer_tilemap_get_id("Tiles_1");
	var floorTile = 10;
	tilemap_tileset(tilemap, oFloorManager.floorFloor);
	tilemap_clear(tilemap, 0);
	
	with (oRoomStartMarker) {
		array_push(centArray, id);
	}
	with (oSpawnSpawner) {
		array_push(centArray, id);
	}
	for (var i = 0; i < array_length(centArray); i++) {
		var startNode = centArray[i];
		var mngr = noone;
		with (oRoomManager) {
			if (RoomID == startNode.RoomID) {
				mngr = id;
			}
		}
	
		
		var claimX = noone;
		var claimY =noone;
		with (oRoomClaimX) {
			if (RoomID == mngr.RoomID) {
				claimX = id;
			}
		}
		with (oRoomClaimY) {
			if (RoomID == mngr.RoomID) {
				claimY = id;
			}
		}
		
		var left = min(claimX.x, claimY.x);
		var right = max(claimX.x, claimY.x)+64;
		var top = min(claimX.y, claimY.y);
		var bottom = max(claimX.y, claimY.y)+64;
		
		var gridWidth = ceil((right-left)/cellSize);
		var gridHeight = ceil((bottom-top)/cellSize);
		
		var roomGrid = ds_grid_create(gridWidth, gridHeight);
		
		var queue = [];
		var startX = floor((startNode.x-left)/cellSize);
		var startY = floor((startNode.y-top)/cellSize);
		array_push(queue, [startX, startY]);
		
		var queueIndex = 0;
		
		while (queueIndex < array_length(queue)) {
			var current = queue[queueIndex];
			queueIndex++;
			
			var gx = current[0];
			var gy = current[1];
			
			if (gx < 0 || gx >= gridWidth || gy < 0 || gy >= gridHeight) {
				continue;
			}
			if (roomGrid[# gx, gy] != 0) {
				continue;
			}
			var worldX = left+ gx * cellSize + cellSize / 2;
			var worldY = top + gy * cellSize + cellSize / 2;
			
			var tileSize = 16;
			for (var tx = 0; tx < 2; tx++) { 
				for (var ty = 0; ty < 2; ty++) {
					var tileWorldX = left + gx * cellSize + tx * tileSize + tileSize / 2;
					var tileWorldY = top + gy * cellSize + ty * tileSize + tileSize / 2;
					
					var globalTileX = floor(tileWorldX / tileSize);
					var globalTileY = floor(tileWorldY / tileSize);
					
					var tileX = globalTileX mod 3;
					var tileY = globalTileY mod 3;
					
					var tileIndex = 5 + tileX + tileY * 4;
					
					tilemap_set_at_pixel(tilemap, tileIndex, tileWorldX, tileWorldY);
				}
			}
			
			if (place_meeting(worldX, worldY, oFlexWall)) {
				roomGrid[# gx, gy] = 2;
				continue;
			}
			
			roomGrid[# gx, gy] = 1;
			
			
			array_push(queue, [gx + 1, gy]);
			array_push(queue, [gx - 1, gy]);
			array_push(queue, [gx, gy + 1]);
			array_push(queue, [gx, gy - 1]);
			
		}
		ds_grid_destroy(roomGrid);
	}
}