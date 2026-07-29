
while (!place_meeting(x, y, oIndestructable)) {
	image_xscale += spreadSpeed;
	//spreadSpeed += 0.01
}
if (place_meeting(x, y, oIndestructable)) {
	spread = false;
} else {
	spread = true;
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

if (existance > 0) {
	existance --;
} else {
	instance_destroy();
}
image_angle += 13