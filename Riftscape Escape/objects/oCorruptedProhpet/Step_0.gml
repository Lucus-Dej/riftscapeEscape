event_inherited();
if (brainDead) {
    exit;
}



if (!place_meeting(x, y, oLineCameraCheck)) {
	enemSpeed = initalSpeed;
} else {
	enemSpeed = 0;
}
