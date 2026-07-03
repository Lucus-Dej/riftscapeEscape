existance--;
if (existance <= 0) {
	var enem = instance_create_layer(Spawner.x, Spawner.y, "Instances", enemHatchling);
	enem.RoomID = RoomID;
	enem.Manager = Manager;
	if (challengeEgg) {
		enem.xp *= 1.2;
	}
	if (bossEgg) {
		enem.xp *= 1.5;
		enem.isBoss = true;
		bossMod(enem);
	}
	with (Manager) {
		diffPool -= enem.spawnWeight;
	}
	instance_destroy();
}