if (instance_exists(host)) {
	x = host.x;
	y = host.y;
} else {
	instance_destroy()
}

if (instance_exists(host) && instance_exists(connector)) {
	if (instance_number(oBulletLightningLink) > 128) {
		host.existance -= 3;
		connector.existance -= 3;
	}
	image_angle = point_direction(x, y, connector.x, connector.y);
	image_xscale = point_distance(x, y, connector.x, connector.y) / 12;
	var dist = point_distance(host.x, host.y, connector.x, connector.y)
	if (dist > 256) {
		instance_destroy()
	}
} else {
	instance_destroy();
}
