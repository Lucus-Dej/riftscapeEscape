conMet = false;
conMetInt = 0;
used = false;
Manager = noone;
gone = false;
childSpawned = false;
child_spawner = noone;
timer = 60;
roomTimeToBeat = -1;
switch (room) {
	case caves01:
	roomTimeToBeat = 12;
	goEvilFloor = caves02;
	break;
	
	case desert01:
	roomTimeToBeat = 24;
	goEvilFloor = desert02;
	break;
	
	case wasteland01:
	roomTimeToBeat = 36;
	goEvilFloor = wasteland02;
	break
	
	case kingdom01:
	roomTimeToBeat = 48;
	goEvilFloor = kingdom02;
	break;
}