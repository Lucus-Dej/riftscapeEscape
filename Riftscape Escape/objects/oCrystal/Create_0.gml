event_inherited()
if (oItemManager.hasLightningCharm) {
	instance_create_layer(x, y, "Items", oLightningCircle);
}
damage = 2 + global.playerDamage * 0.7 + sqrt(global.playerTime) * 1.2;
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