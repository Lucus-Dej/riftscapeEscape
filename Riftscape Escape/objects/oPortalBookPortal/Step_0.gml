existance--;
if (spawnDelay >= 0) {
	spawnDelay--;
}
if (existance <= 0) {
	instance_destroy();
}

if (array_length(travelArray) > 0) {
	for (var i = array_length(travelArray) - 1; i >= 0; i--) {
		if (travelCooldownArray[i] < travelTimer) {
			travelCooldownArray[i]++;
		} else {
			array_delete(travelCooldownArray, i, 1);
			array_delete(travelArray, i, 1);
		}
	}
}