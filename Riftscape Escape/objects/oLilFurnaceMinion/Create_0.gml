target = noone;
path = -1;
evil = false;
pathfindTimer = 0;
target = instance_nearest(x, y, oEnemy);
damage = 0.6;
chaseSpeed = 6;
accelSpeed = 0;
if (oItemManager.hasLostCrown) {
	damage = 1;
	chaseSpeed = 10;
}

flying = true;
if (layer_get_name(layer) != "Flying") {
	layer = layer_get_id("Flying");
}