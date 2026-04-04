// Update the angle
if (init)
orbitAngle += orbitSpeed;

// Calculate the new x and y positions using lengthdir functions
var xOffset = lengthdir_x(orbitDistance, orbitAngle);
var yOffset = lengthdir_y(orbitDistance, orbitAngle);

// Set the projectile's position relative to the target's position
x = orbitTarget.x + xOffset;
y = orbitTarget.y + yOffset;
