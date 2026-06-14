activeDuration = 90;

if (keyboard_check_pressed(vk_space) && object_index != oDullRune) {
	array_push(oPlayerManager.activeRuneArray, object_index);
	//array_delete(oPlayerManager.validRuneArray, host.runeIndex, 1);
	enableRune(object_index);
	with (oRuneSpawner) {
		if (instance_exists(rune) && realRune && id != other.host) {
			array_push(oPlayerManager.validRuneArray, rune.object_index);
		}
	}
	with (oRune) {
		instance_destroy();
	}
	with (instance_nearest(x, y, oItemFlag)) {
		oItemManager.runeCheck = true;
		event_user(0);
	}
}