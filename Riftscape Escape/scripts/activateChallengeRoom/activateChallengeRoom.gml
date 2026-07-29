function activateChallengeRoom(_RID){
	show_debug_message("CHALLENGING ROOMID: "+string(_RID.RoomID))
	
	with (oRoomManager) {
		if (RoomID == _RID.RoomID) {
			isChallenge = true;
		}
	}
	
	
}