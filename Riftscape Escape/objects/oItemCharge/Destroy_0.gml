//array_push(oItemManager.itemList, object_index);
if (!veribroseMark) {
	if (global.chargeItem == noone) {
		global.chargeItem = self;
		global.itemCharges = charges;
		global.currentCharges = global.itemCharges;
	} else if (global.chargeItem != noone) {
		instance_create_layer(x, y, "Instances", global.chargeItem.object_index);
		global.chargeItem = self;
		global.itemCharges = charges;
	}
}

 if (instance_exists(oItemFlag)) {
	 with (oItemFlag) {
		 if (veribroseItem) {
			 veribroseCleanse = true;
		 }
	 }
 }
