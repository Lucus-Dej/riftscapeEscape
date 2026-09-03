if (instance_exists(Manager)) {
if (con && Manager.combatFinished && !used) {
	if (global.gameMinutes <= roomTimeToBeat && global.gameHours == 0) {
		evil = true;
		global.initEvilRoom = true;
	}
	with (oFloorManager) {
		bossRoomSlain = true;
	}
	if (timer > 0) {
		timer--;
	}
	if (timer <= 0) {
		childSpawned = true;
		used = true;
		child_spawner = instance_create_layer(x, y, "Instances", oGoNext);
		if (evil) {
			child_spawner_evil = instance_create_layer(x, y, "Instances", oGoNextEvil)
			with (child_spawner_evil) {
				owned = other.id;
			}
		}
		with (child_spawner) {
			owned = other.id;
		}
	}
	}
} else if (room == endRuneChoiceRoom && con && !used) {
	var valid = false;
	switch (goFloor) {
		case plains0:
		if (global.meta.levels.unlockedPlains) {
			valid = true;
		}
		break;
		case chaoslands0:
		if (global.meta.levels.unlockedChaoslands) {
			valid = true;
		}
		break;
		case library0:
		if (global.meta.levels.unlockedLibrary) {
			valid = true;
		}
		break;
		
		
	}
	if (valid) {
		child_spawner = instance_create_layer(x, y, "Instances", oGoNext);
		with (child_spawner) {
			owned = other.id;
		}
	}
	used = true;
}