function virstItemDeny(){
	if (array_length(oItemManager.virstTargetArray) > 0) {
		var r = irandom(array_length(oItemManager.virstTargetArray) - 1);
		var newlyDeniedItem = oItemManager.virstTargetArray[r];
		show_debug_message("VIRST REMOVING "+ string(newlyDeniedItem));
		var f = array_get_index(oItemManager.deniedItemArray, newlyDeniedItem)
		if (f == -1) {
			array_push(oItemManager.deniedItemArray, newlyDeniedItem);
			itemRemove(newlyDeniedItem, false);
		}
		
		//array_delete(oItemManager.virstTargetArray, r, 1);
	}
}
function virstItemAdd() {
	if (array_length(oItemManager.deniedItemArray) > 0) {
		var r = irandom(array_length(oItemManager.deniedItemArray) - 1);
		var reAddedItem = oItemManager.deniedItemArray[r];
		
		array_delete(oItemManager.deniedItemArray, r, 1);
		show_debug_message("VIRST ADDING "+ string(reAddedItem));
		itemAdd(reAddedItem, false);
		//array_push(oItemManager.virstTargetArray, reAddedItem);
	}
}

function virstItemClear() {
	if (array_length(oItemManager.deniedItemArray) > 0) {
		for (var i = 0; i < array_length(oItemManager.deniedItemArray); i++) {
			var reAddedItem = oItemManager.deniedItemArray[r];
		
			itemAdd(reAddedItem);
			
		}
		oItemManager.deniedItemArray = [];
	}
}