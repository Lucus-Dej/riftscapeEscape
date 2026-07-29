if (place_meeting(x, y, oSuperwalls) || place_meeting(x, y, oSpikes)) {
	chaseSpeed = baseChaseSpeed *0.25;
} else {
	chaseSpeed = baseChaseSpeed;
}
if (path_timer > 0) {
	path_timer--;
} else {
	var dir = point_direction(x, y, follow.x, follow.y);
	image_angle = dir + 90
	path_timer = path_cooldown;
	var check = pathfind(torzGrid, oTruePlayer, chaseSpeed, id)
}
if (attackTimer > 0) {
	attackTimer--;
}