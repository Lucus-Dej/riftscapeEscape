target = noone;
path = -1;
evil = false;
pathfindTimer = 0;
target = instance_nearest(x, y, oEnemy);
damage = 2.5;
if (oItemManager.hasLostCrown) {
	damage = 4;
}
flying = true;
if (layer_get_name(layer) != "Flying") {
	layer = layer_get_id("Flying");
}