event_inherited()
if (!oPlayerManager.hasCrystalReality) {
	goUp = false;
	goLeft = false;
	goDown = false;
	goRight = false;
}
realityCheck = 1;
hasSpawned = false;

if (variable_instance_exists(self, "chainDistance")) {
	chainDistance --;
}
target = noone;
chaseSpeed = (global.playerTime+global.playerThought)/2;
path = -1;
if (oPlayerManager.hasCrystalThought  && chainDistance <= 0) {
	target = instance_nearest(x, y, oEnemy);
	if (target != noone && instance_exists(target)) {
		pathfind(global.Grid, target, chaseSpeed, id);
	}
}
pathTimer = 10;