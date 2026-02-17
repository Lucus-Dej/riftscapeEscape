if (instance_exists(flagManager)) {
if (Manager.combatFinished && !used) {
	used = true
	flagManager.flagTotal++;
	//instance_create_layer(100,100, "Instances", oBoss);
}
}