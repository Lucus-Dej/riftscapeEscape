displayItemFunction(object_index);

if (keyboard_check_pressed(vk_space) && idleTime <= 0) {
	consumableAdd(object_index)
	instance_destroy();
}