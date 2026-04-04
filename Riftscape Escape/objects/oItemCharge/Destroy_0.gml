//array_push(oItemManager.itemList, object_index);

if (global.chargeItem == noone) {
	global.chargeItem = self;
	global.itemCharges = charges;
} else if (global.chargeItem != noone) {
	instance_create_layer(x, y, "Instances", global.chargeItem.object_index);
	global.chargeItem = self;
	global.itemCharges = charges;
}
