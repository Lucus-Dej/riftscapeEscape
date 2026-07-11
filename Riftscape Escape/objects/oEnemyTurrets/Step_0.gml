if (Manager == noone && searchManager) {
	Manager = findManager();
} else if (instance_exists(oWavebasedManager)) {
	with (oWavebasedManager) {
		if (RoomID == other.RoomID) {
			other.searchManager = false;
		}
	}
}

if (!active && Manager != noone) {
	//show_debug_message(Manager)
	if (Manager.inCombat) {
		if (object_index != oEnemyTurretsRandSpawner) {
			image_alpha = 1;
		}
		active = true;
	}
}
if (active && Manager != noone) {
	if (Manager.combatFinished) {
		active = false;
	}
}
if (searchTimer > 0) {
	searchTimer--;
} else {
	searchTimer = searchCooldown;
	searchPlayer();
}
if (flash > 0) {
	flash -= 0.1;
}
if (!active && object_index != oEnemyTurretsRandSpawner) {
	image_alpha = 0.4;
	exit;
}