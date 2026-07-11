if (Manager == noone && instance_exists(oFloorManager)) {
	Manager = findManager()
}
if (spawning == true && !hasSpawnedAll) {
	bossCount--;
	spawning = false;
	Manager.totalBoss--;
	//show_debug_message("i just spawned in"+string(bossName))
	//show_debug_message("i have this many spawns left"+string(bossCount))
}

if (bossCount <= 0) {
	hasSpawnedAll = true;
	hasBoss = false;

    var i = ds_list_find_index(Manager.BossList, id);
    if (i != -1) ds_list_delete(Manager.BossList, i);
}
