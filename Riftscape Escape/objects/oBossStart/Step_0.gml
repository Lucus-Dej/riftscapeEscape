if (spawning == true) {
	bossCount--;
	spawning = false;
	Manager.totalBoss--;
}
if (Manager == noone) {
	findManager()
}
if (bossCount <= 0 && Manager != noone) {
	hasSpawnedAll = true;
	hasBoss = false;

    var i = ds_list_find_index(Manager.BossList, id);
    if (i != -1) ds_list_delete(Manager.BossList, i);
}
