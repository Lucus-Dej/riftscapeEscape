if (ds_exists(damagedList, ds_type_map)) {
    ds_map_destroy(damagedList);
    damagedList = -1;
}
if (oItemManager.hasIceCharm) {
	var startAng = 0;
	var inc = 60;
	for (var i = 0; i < 6; i++) {
		var snow = instance_create_layer(x, y, "Items", oSnowStorm)
		snow.direction = inc*i;
		snow.speed = 6;
	}
	instance_create_layer(x, y, "Items", oLightningCircle);
}