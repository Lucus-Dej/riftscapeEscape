target = instance_nearest(x, y, oEnemy)


if (target == noone) {
	
} else {
	
}
if (instance_exists(target)) {
	chaseSpeedMod += 0.01;
	chaseSpeed += chaseSpeedMod;
	pathfindTimer--;
	if (pathfindTimer <= 0) {
		pathfindTimer = 10;
		pathfind(global.Grid, target, chaseSpeed, id);
	}
	
} else {
	target = instance_nearest(x, y, oEnemy);
	if (target == noone) {
		existance--;
		if (existance <= 0) {
			instance_destroy();
		}
	}
}