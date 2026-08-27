if (instance_exists(oPlayerManager)) {
	if (!oPlayerManager.hasFirstPRune) {
		x = mouse_x;
		y = mouse_y;
	} else {
		if (instance_exists(oTruePlayer)) {
			var camDir = oCamera.direction;
			x = oTruePlayer.x + lengthdir_x(oTruePlayer.nearWallDist*0.8, camDir);
			y = oTruePlayer.y + lengthdir_y(oTruePlayer.nearWallDist*0.8, camDir)
		}
	}
} else {
	x = mouse_x;
	y = mouse_y;
}

