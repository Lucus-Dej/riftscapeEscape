if (follow != noone) {
	xTo = follow.x;
	yTo = follow.y;
	x += (xTo - x)/(80);
	y += (yTo - y)/(80);
}
minionCheck = irandom_range(0, 150);
if (minionCheck == 0 && instance_exists(oEnemy)) {
	var minion = instance_create_layer(x, y, "Instances", oLilFurnaceMinion);
	minion.target = instance_nearest(x, y, oEnemy);
}