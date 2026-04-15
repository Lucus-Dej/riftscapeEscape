if (ds_exists(damagedList, ds_type_map)) {
    ds_map_destroy(damagedList);
    damagedList = -1;
}

z = 0;


if (oItemManager.hasGunpowder && oPlayerManager.hasMinionFate) {
	
	var t = instance_create_layer(x, y, "Instances", global.explosionBullet);
	t.purpose = 1;
} else {
	var f = instance_create_layer(x, y, "Instances",oBoom);
}
audio_play_sound_at(aBoom, x, y, z, 1, 1, 1, false, 0, global.sfxAudio)