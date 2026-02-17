if (iframe >= 0) {
	iframe--;
}
if (rotate) {
	orbitAngle += 2; 
	x = orbitCenter.x + lengthdir_x(orbitRadius, orbitAngle);
	y = orbitCenter.y + lengthdir_y(orbitRadius, orbitAngle);
}