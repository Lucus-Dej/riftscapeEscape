item = noone;
with (oItemManager) {
	searchItem = true;
	dropID = other.id;
}
if (spawnItem && item != noone) {
	summon = instance_create_layer(x, y, "Instances", item);
	summon.rarity = rarity;
	spawnItem = false;
}
