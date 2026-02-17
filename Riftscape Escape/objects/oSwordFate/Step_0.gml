direction = swordAng;
image_angle = swordAng;
if (swordAng <= 0) {
	swordAng = 360;
}
x = oTruePlayer.x;
y = oTruePlayer.y;
if (oPlayerManager.moveSword) {
swordAng += 6;
}

