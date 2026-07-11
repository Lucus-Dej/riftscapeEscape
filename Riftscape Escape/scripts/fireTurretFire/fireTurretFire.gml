function fireTurretFireLine(_angle, _dist = 80, _num = 6){
	
	for (var i = 0; i < _num; i++) {
		var disBetween = i * _dist;
		var px = x + lengthdir_x(disBetween, _angle);
        var py = y + lengthdir_y(disBetween, _angle);
		
		var b = bulletFire(px, py, 0, 0, damage, oFireBullet, id, true);
		
		 b.existance = 1;
		 b.isGhost = true;
	}
}
/*function spawnFireLine(_angle) {
    spawnFireHalf(_angle);        // forward
    spawnFireHalf(_angle + 180);  // backward
}

function spawnFireHalf(_angle) {
    var maxDist = lineLength;

    var hit = collision_line( x, y, x + lengthdir_x(maxDist, _angle), y + lengthdir_y(maxDist, _angle), oSuperwalls, false, true);

    if (hit != noone) {
        maxDist = point_distance(x, y, hit.x, hit.y);
    }

    var count = floor(maxDist / lineSpacing);

    for (var i = 1; i <= count; i++) {
        var dist = i * lineSpacing;

        var px = x + lengthdir_x(dist, _angle);
        var py = y + lengthdir_y(dist, _angle);

        var b = bulletFire(px, py, 0, 0, damage/2, owdBullets, id, true);

        b.accel = false;
        b.infExist = false;
        b.existance = lineInterval + 1;

        b.image_xscale = 2;
        b.image_yscale = 2;
    }
}