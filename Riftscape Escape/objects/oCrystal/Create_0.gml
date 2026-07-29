event_inherited()

target = noone;
chaseSpeed = (global.playerTime+global.playerThought)/2;
path = -1;
if (oPlayerManager.hasCrystalThought) {
	target = instance_nearest(x, y, oEnemy);
	if (target != noone && instance_exists(target)) {
		pathfind(global.Grid, target, chaseSpeed, id);
	}
}
pathTimer = 10;