item = noone;
with (oItemManager) {
	searchItem = true;
	dropID = other.id;
}
if (spawnItem && item != noone) {
	instance_create_layer(x, y, "Instances", item)
	spawnItem = false;
}
