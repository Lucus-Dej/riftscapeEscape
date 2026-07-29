if (instance_exists(follow)) {
	xTo = follow.x;
	yTo = follow.y;
} else {
	instance_destroy();
	exit;
}
if (array_length(damageArray) > 0) {
	for (var i = array_length(damageArray) - 1; i >= 0; i--) {
		if (damageTimerArray[i] < dmgRefreshTime) {
			damageTimerArray[i]++;
		} else {
			array_delete(damageTimerArray, i, 1);
			array_delete(damageArray, i, 1);
		}
	}
}
x += (xTo - x)/50;
y += (yTo - y)/50;