function createSpecialRoom(_type, _array){
	var i = irandom(array_length(_array)-1)
	var door = _array[i];
	var dir = _array[i].doorDir;
	switch (_type) {
	    case "item":
	        // code here
	        break;
		case "boss":
	        // code here
	        break;
	    default:
	        // code here
	        break;
	}
}
function findSpecialRoom (_sideAngle, _tag) {
	var angle = getOppositeDoorDir(_sideAngle)
	var validPool  = tag_get_asset_ids(angle, asset_room)
	var realPool = [];
	
	for (var t = 0; t < array_length(validPool); t++) {
		var roomCheck = validPool[t];
		var tags = asset_get_tags(roomCheck);
	    if (array_contains(tags, _tag)) {
			array_push(realPool, roomCheck);
		}
		
	}
	if (array_length(realPool) == 0) {
		show_debug_message("no special room found i guess?")
		return noone;
	}
	show_debug_message(realPool)
	return realPool[irandom(array_length(realPool)-1)];
}