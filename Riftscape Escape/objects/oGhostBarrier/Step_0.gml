if (used) {
	if (instance_exists(Manager1) && instance_exists(Manager2)) {
		if (Manager1.combatFinished || Manager2.combatFinished) {
			instance_destroy(childDoor);
			used = false;
			}	
		} else if (instance_exists(Manager1) && !instance_exists(Manager2)) {
		if (Manager1.combatFinished) { 
			instance_destroy(childDoor);
			used = false;
		}
	} else if (!instance_exists(Manager1) && instance_exists(Manager2)) {
		if (Manager2.combatFinished) { 
			instance_destroy(childDoor);
			used = false;
		}
	}
}
if (invalid && invalidBlock == noone) {
	//invalidBlock = instance_create_layer(x, y, "Instances", oWastelandWall)
}