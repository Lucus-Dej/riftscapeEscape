BossList = ds_list_create();
totalBoss = 0;
with (oBossStart) {
    if (bossCount > 0) {
        ds_list_add(other.BossList, id);
		other.totalBoss += bossCount;
    }
}
