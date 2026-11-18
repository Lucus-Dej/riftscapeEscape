if (!active) {
	exit;
}
if (array_length(lightMarkerArray) >= markerLimit) {
	active = false;
	unpowerDoor(doorID, true);
}