event_inherited()
chainDistance = 0;
if (variable_instance_exists(self, "chainDistance")) {
	chainDistance = 0;
}
target = noone;
chaseSpeed = (global.playerTime+global.playerThought)/2;;
path = -1;
if (oPlayerManager.hasCrystalThought && chainDistance <= 0) {
	target = instance_nearest(x, y, oEnemy);
	if (target != noone && instance_exists(target)) {
		pathfind(global.Grid, target, chaseSpeed, id);
	}
}
pathTimer = 10;