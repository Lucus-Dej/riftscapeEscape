if (instance_exists(rmManager) && rmManager.combatFinished && !finishedCombat) {
	alarm[0] = 12;
	finishedCombat = true;
}
if (!instance_exists(oDestructablePrisonWall) && instance_exists(oTutMask)) {
	instance_destroy(oTutMask)
}