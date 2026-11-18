wall = oLibraryWall2;
madeWall = noone;

turnOn = function() {
	if (!instance_exists(madeWall)) {
		madeWall = instance_create_layer(x, y, "Instances", wall);
	}
}
turnOff = function() {
	if (instance_exists(madeWall)) {
		instance_destroy(madeWall);
	}
}
turnOn();