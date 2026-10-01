event_inherited()
if (oItemManager.hasLightningCharm) {
	instance_create_layer(x, y, "Items", oLightningCircle);
}
get = noone;
damage = 1.4 + global.playerDamage * 0.5 + sqrt(global.playerTime) * 1.1;
chaseSpeed = (global.playerTime+global.playerThought)/10;
path = -1;
if (oPlayerManager.hasCrystalThought) {
	target = instance_nearest(x, y, oEnemy);
	if (target != noone && instance_exists(target)) {
		pathfind(global.Grid, target, chaseSpeed, id);
	}
}
pathTimer = 10;