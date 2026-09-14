if (existence > 0) {
	existence--;
	var incRate = existence/exisTotal;
	image_xscale += 0.3*incRate;
	image_yscale += 0.3*incRate;
	image_alpha = incRate;
} else {
	instance_destroy();
}
if (instance_exists(oTruePlayer) && followPlayer) {
	x = lerp(x, oTruePlayer.x, 0.03);
	y = lerp(y, oTruePlayer.y, 0.03);
}