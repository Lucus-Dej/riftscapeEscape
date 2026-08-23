if (!instance_exists(follow)) {
	instance_destroy()
}
if (follow != noone && instance_exists(follow)) {
	xTo = follow.x;
	yTo = follow.y;
	x += (xTo - x)/(80);
	y += (yTo - y)/(80);
}

if (oItemManager.hasLostCrown) {
	minionCheck = irandom_range(0, 120);
} else {
	minionCheck = irandom_range(0, 360);
}

if (minionCheck == 0 && instance_exists(oEnemy)) {
	var minion = instance_create_layer(x, y, "Instances", oLilFurnaceMinion);
	minion.evil = evil;
	if (evil) {
		minion.target = instance_nearest(x, y, oTruePlayer);
	} else {
		minion.target = instance_nearest(x, y, oEnemy);
	}
	
}