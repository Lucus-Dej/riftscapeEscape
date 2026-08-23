if (global.inCombat) {
	existence-= 0.5;
} else {
	existence -= 0.01;
}
if (existence <= 0) {
	instance_destroy()
}
var balancedScale = existence/existenceTot;

image_xscale = baseScale*balancedScale;
image_yscale = baseScale*balancedScale;
image_angle += 17*balancedScale;
if (instance_exists(oTruePlayer)) {
	x = oTruePlayer.x;
	y = oTruePlayer.y;
}