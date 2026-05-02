if (oPlayerManager.hasCrystalThought  && chainDistance <= 0) {
	target = instance_nearest(x, y, oEnemy);
	pathTimer--;
	if (target != noone && instance_exists(target) && pathTimer <= 0) {
		pathfind(global.Grid, target, chaseSpeed, id);
		pathTimer = 10;
	}
}