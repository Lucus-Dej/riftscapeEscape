function fireFireFireCharm(_x, _y, _dir, _spd){
	var f = instance_create_layer(_x, _y, "Items", oFireCharmSpec);
	f.direction = _dir;
	f.speed = _spd;
}