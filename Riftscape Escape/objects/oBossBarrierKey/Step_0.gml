if (instance_exists(Manager)) {
	if (Manager.combatFinished && !used) {
	used = true
	bossManager.locksDone++;
	}
}

