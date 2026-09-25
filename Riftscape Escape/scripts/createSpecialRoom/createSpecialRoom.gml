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
function findSpecialRoom (_sideAngle, _tag, _filterByDiff = false) {
	var minDif = 0;
	var maxDif = 10;
	var tagged = false;
	var difficulty = -1;
	if (instance_exists(oFloorManager)) {
		minDif = oFloorManager.minDiff;
		maxDif = oFloorManager.maxDiff;
	}
	var angle = getOppositeDoorDir(_sideAngle)
	var validPool  = tag_get_asset_ids(angle, asset_room)
	var realPool = [];
	if (!_filterByDiff) {
		for (var t = 0; t < array_length(validPool); t++) {
			var roomCheck = validPool[t];
			var tags = asset_get_tags(roomCheck);
		    if (array_contains(tags, _tag)) {
				array_push(realPool, roomCheck);
			}
		}
	} else {
		for (var t = 0; t < array_length(validPool); t++) {
			var roomCheck = validPool[t];
			var tags = asset_get_tags(roomCheck);
			for (var j = 0; j < array_length(tags); j++) {
				var tag = tags[j];
				if (string_starts_with(tag, "difficulty:")) {
					difficulty = real(string_copy(tag, 12, string_length(tag)));
					break;
				}
			}
		    if (array_contains(tags, _tag) && difficulty >= minDif && difficulty <= maxDif) {
				array_push(realPool, roomCheck);
			}
		
		}
	}
	
	if (array_length(realPool) == 0) {
		show_debug_message("no special room found i guess?")
		return noone;
	}
	//show_debug_message(realPool)
	return realPool[irandom(array_length(realPool)-1)];
}