existance--;
if (existance <= 0) {
	var enem = instance_create_layer(x, y, "Instances", enemHatchling);
	if (challengeEgg) {
		enem.xp *= 1.2;
	}
	if (bossEgg) {
		enem.xp *= 1.5;
		bossMod(enem);
	}
	instance_destroy();
}