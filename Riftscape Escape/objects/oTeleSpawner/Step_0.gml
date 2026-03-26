if (instance_exists(Manager)) {
if (con && Manager.combatFinished && !used) {
	show_debug_message(timer)
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
}
