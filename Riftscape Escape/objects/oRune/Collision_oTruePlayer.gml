activeDuration = 90;

if (keyboard_check_pressed(vk_space)) {
	array_push(oPlayerManager.activeRuneArray, id);
	enableRune(object_index);
	with (oRune) {
		instance_destroy();
	}
	with (instance_nearest(x, y, oItemFlag)) {
		oItemManager.runeCheck = true;
		event_user(0);
	}
}