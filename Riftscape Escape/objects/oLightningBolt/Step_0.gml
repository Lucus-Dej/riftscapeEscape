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
existence--;
if (existence <= 10) {
	image_alpha -= 0.1;
}
if (existence <= 0) {
	instance_destroy();
}
flash -= 0.02;