if (ds_exists(damagedList, ds_type_map)) {
    ds_map_destroy(damagedList);
    damagedList = -1;
}
if (oPlayerManager.hasCrystalFate) {
	ran1 = instance_create_layer(x+irandom_range(-96, 96), y+irandom_range(-96, 96), "Instances", oChildCrystal)
	ran2 = instance_create_layer(x+irandom_range(-96, 96), y+irandom_range(-96, 96), "Instances", oChildCrystal)
	ran3 = instance_create_layer(x+irandom_range(-96, 96), y+irandom_range(-96, 96), "Instances", oChildCrystal)
	ran4 = instance_create_layer(x+irandom_range(-96, 96), y+irandom_range(-96, 96), "Instances", oChildCrystal)
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
	
	ran3.goUp = goUp;
	ran3.goLeft = goLeft
	ran3.goRight = goRight;
	ran3.goDown = goDown;
	ran3.chainDistance = chainDistance
	
	ran4.goUp = goUp;
	ran4.goLeft = goLeft
	ran4.goRight = goRight;
	ran4.goDown = goDown;
	ran4.chainDistance = chainDistance
	
}
if (goUp) {
	up = instance_create_layer(x, y+32, "Instances", oChildCrystal)
	up.goUp = goUp;
	up.chainDistance = chainDistance
}
if (goLeft) {
	left = instance_create_layer(x-32, y, "Instances", oChildCrystal)
	left.goLeft = goLeft;
	left.chainDistance = chainDistance
}
if (goDown) {
	down = instance_create_layer(x, y-32, "Instances", oChildCrystal)
	down.goDown = goDown;
	down.chainDistance = chainDistance
}
if (goRight) {
	right = instance_create_layer(x+32, y, "Instances", oChildCrystal)
	right.goRight = goRight;
	right.chainDistance = chainDistance
}
