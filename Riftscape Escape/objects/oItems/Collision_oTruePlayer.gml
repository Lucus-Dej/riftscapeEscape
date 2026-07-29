if (!randomItem) {
	displayItemFunction(object_index);
} else {
	displayItemFunction("ran");
}


if (keyboard_check_pressed(vk_space)) {
	grabed = true;
	veribroseMark = false;
	removeFromItemPool(object_index)
	instance_destroy();
	
}