if (ds_exists(damagedList, ds_type_map)) {
    ds_map_destroy(damagedList);
    damagedList = -1;
}
if (oPlayerManager.hasCrystalFate) {
	ran1 = instance_create_layer(x+irandom_range(-96, 96), y+irandom_range(-96, 96), "Instances", oChildCrystalEssence)
	ran2 = instance_create_layer(x+irandom_range(-96, 96), y+irandom_range(-96, 96), "Instances", oChildCrystalEssence)

	ran1.goUp = goUp;
	ran1.goLeft = goLeft
	ran1.goRight = goRight;
	ran1.goDown = goDown;
	ran1.chainDistance = chainDistance
	
	ran2.goUp = goUp;
	ran2.goLeft = goLeft
	ran2.goRight = goRight;
	ran2.goDown = goDown;
	ran2.chainDistance = chainDistance
}
if (goUp) {
	up = instance_create_layer(x, y+32, "Instances", oChildCrystalEssence)
	up.goUp = goUp;
	up.chainDistance = chainDistance
}
if (goLeft) {
	left = instance_create_layer(x-32, y, "Instances", oChildCrystalEssence)
	left.goLeft = goLeft;
	left.chainDistance = chainDistance
}
if (goDown) {
	down = instance_create_layer(x, y-32, "Instances", oChildCrystalEssence)
	down.goDown = goDown;
	down.chainDistance = chainDistance
}
if (goRight) {
	right = instance_create_layer(x+32, y, "Instances", oChildCrystalEssence)
	right.goRight = goRight;
	right.chainDistance = chainDistance
}
