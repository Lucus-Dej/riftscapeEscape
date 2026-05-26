var dist = point_distance(oTruePlayer.x, oTruePlayer.y, x, y);

radius = lerp(radius, targetRadius, 0.004);

if (dist > radius && active) {
	with (oTruePlayer) {
		collision_circle_list(x, y, 33, oKingdomWall, false, false, other.wallList, false);
		for (var i = ds_list_size(other.wallList) - 1; i >= 0; i--) {
			var wall = other.wallList[| i];
			if (instance_exists(wall)) {
				with (wall) {
					instance_destroy();
				}
			}
		}
		ds_list_clear(other.wallList);
	}
	var dir = point_direction(oTruePlayer.x, oTruePlayer.y, x, y);
	if (radius > targetRadius*1.2) {
		

    // ramps stronger over time
    pullForce += 0.2;

    // cap ramp
    pullForce = min(pullForce, 32);

    // stronger near center
    var pull = pullForce + (800 / max(dist, 1));

    oTruePlayer.x += lengthdir_x(pull, dir);
    oTruePlayer.y += lengthdir_y(pull, dir);
	} else {
		var pull = global.player_speed;
		oTruePlayer.x += lengthdir_x(pull, dir);
		oTruePlayer.y += lengthdir_y(pull, dir);
	}

}