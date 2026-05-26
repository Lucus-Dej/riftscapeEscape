function startBuildRoom(_fID, _rID){
	show_debug_message("I AM BUILDING")
	with (_rID) {
		if (_fID.deep > 0) {
			builder = instance_create_layer(x, y, "Instances", oRoomBuilder);
			show_debug_message("I HAVE MADE THE BUILDER")
			builder.owner = id;
			builder.RoomID = RoomID;
			built = true;
		}
	}
	with (_fID) {
		
	}
}