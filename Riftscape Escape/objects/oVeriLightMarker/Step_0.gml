if (place_meeting(x, y, oVeriLaser)) {
	active = true;
} else {
	active = false;
}
if (!instance_exists(host)) {
	with (oVeriLightManager) {
		if (veriID == other.veriID) {
			other.host = id;
		}
	}
}
if (active) {
	sprite_index = sVeriLightMarkerActive;
	if (instance_exists(host)) {
		var isInArray = array_get_index(host.lightMarkerArray, id);
		if (isInArray == -1) {
			array_push(host.lightMarkerArray, id);
		}
	}
	
} else {
	if (instance_exists(host)) {
		var isInArray = array_get_index(host.lightMarkerArray, id);
		if (isInArray != -1) {
			array_delete(host.lightMarkerArray, isInArray, 1);
		}
	}
	
	sprite_index = sVeriLightMarker;
}