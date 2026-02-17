damagedList = ds_map_create();
existance = 12;
didColide = false;
hasSpawned = false;

if (!variable_instance_exists(self, "goUp")) {
	goUp = false;
}
if (!variable_instance_exists(self, "goRight")) {
	goRight = false;
}
if (!variable_instance_exists(self, "goLeft")) {
	goLeft = false;
}
if (!variable_instance_exists(self, "goDown")) {
	goDown = false;
}
if (variable_instance_exists(self, "chainDistance")) {
	chainDistance --;
}