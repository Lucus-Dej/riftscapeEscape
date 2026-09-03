//instance_destroy(oTruePlayer);
if (drawDesc == "") {
	drawDesc = displayNextLevel(owned.goFloor)
}
oPlayerManager.runeTxt = "Press Space To Enter "+string(drawDesc); 
oPlayerManager.displayRuneDuration = 60;
if (room == tutorial) {
	game_restart();
}
if (keyboard_check_pressed(vk_space)) {
	instance_destroy(oPlayer);
	global.bigGo = fromFloor;
	if (oItemManager.veriFlagTP && oItemManager.hasVeribroseEssence) {
		oItemManager.savedRoom = owned.goFloor;
		owned.goFloor = veribroseItemRoom;
		oItemManager.veriFlagTP = false;
	}
	if (room == veribroseItemRoom) {
		owned.goFloor = oItemManager.savedRoom;
	}
	room_goto(owned.goFloor);
	
}