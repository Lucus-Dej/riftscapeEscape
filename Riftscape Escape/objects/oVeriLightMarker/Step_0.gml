if (place_meeting(x, y, oVeriLaser)) {
	active = true;
} else {
	active = false;
}
if (active) {
	sprite_index = sVeriLightMarkerActive;
} else {
	sprite_index = sVeriLightMarker;
}