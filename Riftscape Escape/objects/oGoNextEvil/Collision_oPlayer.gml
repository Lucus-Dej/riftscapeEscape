//instance_destroy(oTruePlayer);
if (keyboard_check_pressed(vk_space)) {
	instance_destroy(oPlayer);
	global.bigGo = fromFloor;
	if (oItemManager.veriFlagTP && oItemManager.hasVeribroseEssence) {
		oItemManager.savedRoom = owned.goEvilFloor;
		owned.goEvilFloor = veribroseItemRoom;
		oItemManager.veriFlagTP = false;
	}
	if (room == veribroseItemRoom) {
		owned.goEvilFloor = oItemManager.savedRoom;
	}
	room_goto(owned.goEvilFloor);
	
}