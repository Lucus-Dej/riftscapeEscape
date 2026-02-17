with (oBossBarrier) {
	if (doorID == other.LockID) {
		ds_list_add(other.bossDoorList, id);
		bossManager = other.id;
		break;
	}
}
if (lockAmount == locksDone) {
	doorUnlocked = true;
}
with (oBossBarrierKey) {
    if (KeyID == other.LockID) {
        ds_list_add(other.bossKeyList, id);
		bossManager = other.id;
    }
}