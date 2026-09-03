// Inherit the parent event
event_inherited();
orbitCenter = instance_nearest(x, y, oTruePlayer);
if (orbitRadius > 80) {
	orbitRadius -= 0.1;
}
image_angle += 17;