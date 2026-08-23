existance--;
if (existance <= 0) {
	var enem = instance_create_layer(Spawner.x, Spawner.y, "Instances", enemHatchling);
	enem.RoomID = RoomID;
	enem.Manager = Manager;
	if (challengeEgg) {
		enem.xp *= 1.25;
	}
	if (bossEgg) {
		enem.xp *= 2.5;
		enem.isBoss = true;
		bossMod(enem);
	}
	if (Manager.object_index == oWavebasedManager && !bossEgg) {
		enem.xp *= 0.5;
	}
	
	instance_destroy();
}