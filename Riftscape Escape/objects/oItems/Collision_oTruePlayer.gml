if (!randomItem) {
	displayItemFunction(object_index);
} else {
	displayItemFunction("ran");
}


if (keyboard_check_pressed(vk_space)) {
	if (shopItem) {
		if (oItemManager.luckBonus > 0) {
			grabed = true;
			removeFromItemPool(object_index)
			instance_destroy();
			oItemManager.luckBonus -= price;
		}
	} else {
		grabed = true;
		veribroseMark = false;
		if (clearElseOnDeath) {
			with (oItems) {
				if (clearID != other.clearID && validForClear) {
					instance_destroy();
				}
			}
		}
		removeFromItemPool(object_index)
		instance_destroy();
	}
	
	
}