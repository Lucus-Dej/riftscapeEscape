if (playerSpawn == true && !global.playerSpawned) {
	instance_create_layer(x, y, "Instances", oTruePlayer);
	instance_create_layer(x, y, "Instances", oCamera);
	global.playerSpawned = true;
} //else { 
//	if (global.bigGo ==  && !instance_exists(oTruePlayer)) {
//		instance_create_layer(x,y, "Instances", oTruePlayer);
//	}
//}