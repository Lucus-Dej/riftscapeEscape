inEssenceHuskCircle = false;
isLightExcluded = false;
hsp = 0;
vsp = 0;
immuneToContactDmg = false;
orbitCount = 0;
torzPower = 0;
hasDamaged = false;
inCircle = false;
visual = noone;
flash = 0;
damageArray = [];
damageTimerArray = [];
dmgRefreshTime = 40;
locked = false;
lockedTimer = 0;
trackerQueue = ds_queue_create();
trackerTimer = 0;
trackerDelay = 6;
trackerNodeLimit = 12;
if (oPlayerManager.hasVirstRune) {
	refreshItemPool()
	for (var i = 0; i < array_length(oItemManager.itemList); i++) {
		var byebyeItem = oItemManager.itemList[irandom(array_length(oItemManager.itemList)-1)];
		itemRemove(byebyeItem)
		var item = rollItem(true, itemSearchType.random);
		itemAdd(item);
	}
}
nearWallDist = -1;
line = instance_create_layer(x, y, "Instances", oLineCameraCheck);
if (!instance_exists(oFloorManager)) {
	with (oRoomManager) {
		event_user(5);
	}
}