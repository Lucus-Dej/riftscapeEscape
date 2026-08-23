if (tempEnem) {
	exit;
}
// Inherit the parent event
event_inherited();

if (instance_exists(host)) {
	host.minionCount--;
	var i = array_get_index(host.minionArray, id);
	array_delete(host.minionArray, i, 1);
}
