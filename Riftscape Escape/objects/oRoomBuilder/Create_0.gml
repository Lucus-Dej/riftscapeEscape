level = 1;
deep = 4;
//doorList = ds_list_create();
doorCount = 0;

//checks room for doors
with (oGhostBarrier) {
	if (checked) {
		continue;
	} else if (doorDir == "up") {
		canUp = true;
		other.doorCount++;
	} else if (doorDir == "left") {
		canLeft = true;
		other.doorCount++;
	} else if (doorDir == "down") {
		canDown = true;
		other.doorCount++;
	} else if (doorDir == "right") {
		canRight = true;
		other.doorCount++;
	}
}
var newRoom = choose(cavesD, cavesL, cavesLR);

room_instance_add(x, y, newRoom, "Instances");