if (ds_exists(damagedList, ds_type_map)) {
    ds_map_destroy(damagedList);
    damagedList = -1;
}
if (oPlayerManager.hasCrystalFate) {
	ran1 = instance_create_layer(x+irandom_range(-96, 96), y+irandom_range(-96, 96), "Instances", oChildCrystal)
	ran2 = instance_create_layer(x+irandom_range(-96, 96), y+irandom_range(-96, 96), "Instances", oChildCrystal)
	ran3 = instance_create_layer(x+irandom_range(-96, 96), y+irandom_range(-96, 96), "Instances", oChildCrystal)
	ran4 = instance_create_layer(x+irandom_range(-96, 96), y+irandom_range(-96, 96), "Instances", oChildCrystal)
	
}
