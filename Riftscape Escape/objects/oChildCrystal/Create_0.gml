if (!oPlayerManager.hasCrystalReality) {
	goUp = false;
	goLeft = false;
	goDown = false;
	goRight = false;
}
realityCheck = 1;
hasSpawned = false;

if (variable_instance_exists(self, "chainDistance")) {
	chainDistance --;
}