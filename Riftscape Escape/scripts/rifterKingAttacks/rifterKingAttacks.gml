function rifterKingAttacks(){

}
function rkWave() {

	var dir = point_direction(x, y, oTruePlayer.x, oTruePlayer.y);

	var arc = 90; 
	
	for (var i = 0; i < segments; i++) {

		var t = i / max(segments - 1, 1);

		var startingAng = point_direction(x, y, oTruePlayer.x, oTruePlayer.y)
		var fireDir = dir - arc/2 + (arc * t);

		var f = bulletFire(x, y, fireDir, 11, damage / 1.25, oRifterKingBullets, id);
		f.canDecel = true;
		f.decelRate = 0.06;
		f.existance = 810;
		f.accel = false;
		f.image_xscale = 1.5;
		f.image_yscale = 1.5;
	}
}
function rkBlackOut(_count) {
	var placed = 0;
	var attempts = 0;
	var maxAttempts = array_length(flagArray) * 3;
	show_debug_message(string(placed)+string(_count)+string(attempts)+string(maxAttempts));
	while ((placed < _count) && (attempts < maxAttempts)) {
		attempts++;

		var i = irandom(array_length(flagArray) - 1);
		var spawner = flagArray[i];

		if (!spawner.inUse) {

			var blackout = instance_create_layer(spawner.x, spawner.y, "Instances", oRifterKingBlackout);

			spawner.inUse = true;

			blackout.host = spawner;

			placed++;
		}
	}
}
function rkPhaseWall() {

	var radius = 1200;

	for (var i = 0; i < 32; i++) {
	    var angle = i * (360 / 32);
	    var bx = x + lengthdir_x(radius, angle);
	    var by = y + lengthdir_y(radius, angle);
		var b = bulletFire(bx, by, 4, 0, damage, oRifterKingBullets, id)
		b.type = 2;
	    b.image_xscale = 4;
		b.image_yscale = 4;
		b.image_angle = 0;
		b.playerSummon = true;
	    b.orbitCenter = oRifterKingCenter;
	    b.orbitAngle = angle;
		b.orbitSpeed = 6.5;
	    b.orbitRadius = radius;
		b.targetRadius = 580;
		b.accel = false;
		b.existance = 99999;
		b.infExist = true;
		b.rotate = true;
	}
}
function rkSlamNado() {
	var startAng = 0;
	while (startAng < 359) {
		var b = bulletFire(x, y, startAng, 9, damage, oRifterKingBullets, id);
		b.canDecel = true;
		b.decelRate = 0.16;
		b.existance = 300;
		startAng += 45;
	}
}