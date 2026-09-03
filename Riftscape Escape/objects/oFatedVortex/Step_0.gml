existence--;

if (existence < 0) {
	instance_destroy();
}
if (instance_exists(oTruePlayer)) {
	var dir = point_direction(x, y, oTruePlayer.x, oTruePlayer.y);
	image_angle = dir-90;
	var playerDist = point_distance(x, y, oTruePlayer.x, oTruePlayer.y);
	var pull = 5;
	var blackHoleCheck = collision_line(x, y,oTruePlayer.x, oTruePlayer.y, oWalls, false, true);
	if (playerDist < pullDist && blackHoleCheck == noone) {
		oTruePlayer.x -= lengthdir_x(pull*0.8, dir);
		oTruePlayer.y -= lengthdir_y(pull*0.8, dir);
	}
}
image_alpha = (existence/existTot)+0.1;
var i = irandom_range(1, existence);
var chance = 31 * (1 - existence / existTot);
chance = clamp(chance, 0, 31);
if (random(100) < chance) {
	var ranAng = irandom_range(-40, 40);
	var startingX = x + lengthdir_x(fireDist, image_angle+ranAng+90);
	var startingY = y + lengthdir_y(fireDist, image_angle+ranAng+90);
	var ang = point_direction(startingX, startingY, x, y);
	var b = bulletFire(startingX, startingY, ang, 5, 15, oBadBullet, id, true)
	b.isGhost = true;
	b.image_xscale /= 2;
	b.image_yscale /= 2;
	b.existance = 80;
}
if (!instance_exists(host)) {
	instance_destroy();
}