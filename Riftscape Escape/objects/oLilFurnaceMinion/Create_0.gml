target = noone;
path = -1;
pathfindTimer = 0;
target = instance_nearest(x, y, oEnemy);
damage = 2.5;
if (oItemManager.hasLostCrown) {
	damage = 4;
}