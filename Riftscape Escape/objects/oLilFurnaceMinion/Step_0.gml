if (instance_exists(target)) {
	pathfindTimer--;
	if (pathfindTimer <= 0) {
		pathfindTimer = 10;
		pathfind(global.Grid, target, 7.5, id);
	}
	
} else {
	target = instance_nearest(x, y, oEnemy);
	if (target == noone) {
		instance_destroy();
	}
}