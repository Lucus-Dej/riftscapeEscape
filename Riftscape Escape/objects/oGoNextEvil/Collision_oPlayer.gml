//instance_destroy(oTruePlayer);
if (drawDesc == "") {
	drawDesc = displayNextLevel(owned.goEvilFloor)
}
oPlayerManager.runeTxt = "Press Space To Enter "+string(drawDesc); 
oPlayerManager.displayRuneDuration = 60;
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