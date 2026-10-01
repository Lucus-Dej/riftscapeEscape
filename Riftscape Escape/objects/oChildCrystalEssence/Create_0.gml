event_inherited()
if (oItemManager.hasLightningCharm) {
	instance_create_layer(x, y, "Items", oLightningCircle);
}
if (!oPlayerManager.hasCrystalReality) {
	goUp = false;
	goLeft = false;
	goDown = false;
	goRight = false;
}
realityCheck = 1;
hasSpawned = false;
damage = 0.3 + global.playerDamage * 0.4 + sqrt(global.playerEssence) * 1.1;
target = noone;
chaseSpeed = (global.playerTime+global.playerThought)/10;
path = -1;
if (oPlayerManager.hasCrystalThought) {
	target = instance_nearest(x, y, oEnemy);
	if (target != noone && instance_exists(target)) {
		pathfind(global.Grid, target, chaseSpeed, id);
	}
}
pathTimer = 10;