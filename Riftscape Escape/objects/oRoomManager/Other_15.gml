with (oSuperwalls) {
	if (RoomID == other.RoomID) {
		var temp = {xpos: x, 
			ypos: y, 
			xscale: image_xscale, 
			yscale: image_yscale
		}
		array_push(other.miniMapWalls, temp);
	}
}
with (oGhostBarrier) {
	if (RoomID == other.RoomID) {
		var temp = {
		    xpos: x,
		    ypos: y,
		    boss: doorType == "boss"
		}
		array_push(other.miniMapDoors, temp);
	}
}