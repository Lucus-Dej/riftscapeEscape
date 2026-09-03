if (image_xscale < cap) {
	image_xscale += increaseRate;
	image_yscale += increaseRate;
}
existance--;
if (existance <= 0) {
	instance_destroy();
}

if (existance <= 100) {
	image_alpha -= 0.01;
}
if (instance_exists(host) && host.object_index == oRifterKing) {
	x = oRifterKing.x;
	y = oRifterKing.y;
}
