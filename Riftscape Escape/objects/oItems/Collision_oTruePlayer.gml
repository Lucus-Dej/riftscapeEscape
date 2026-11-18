if (!randomItem) {
	displayItemFunction(object_index);
} else {
	displayItemFunction("ran");
}


if (keyboard_check_pressed(vk_space)) {
	if (shopItem) {
		if (oItemManager.luckBonus + oItemManager.reflectiveGemLuckBonus > 0) {
			grabed = true;
			removeFromItemPool(object_index)
			instance_destroy();
			oItemManager.itemsBought++;
			if (oItemManager.itemsBought >= 8 && !global.meta.challenges.gotItemItemsPlus) {
				showChallenge("gotItemItemsPlus");
				global.meta.challenges.gotItemItemsPlus = true;
			}
			if (oItemManager.flagNextShopItemFree) {
				//nothing :)
				oItemManager.flagNextShopItemFree = false;
			} else if (oItemManager.flagNextShopItemDiscount) {
				oItemManager.luckBonus -= price/2;
				oItemManager.flagNextShopItemDiscount = false;
			} else {
				oItemManager.luckBonus -= price;
			}
			
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