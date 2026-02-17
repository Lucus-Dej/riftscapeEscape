if (keyboard_check_pressed(vk_space)) {
	instance_destroy(oPlayer);
	global.bigGo = fromFloor;
	room_goto(owned.goEvilFloor);
}