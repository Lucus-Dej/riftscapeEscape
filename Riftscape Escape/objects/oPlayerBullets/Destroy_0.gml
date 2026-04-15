if (ds_exists(damagedList, ds_type_map)) {
    ds_map_destroy(damagedList);
    damagedList = -1;
}
if (canOrbit) oTruePlayer.orbitCount--;
z = 0;
var t = instance_create_layer(x, y, "Instances", global.explosionBullet);
if (oItemManager.hasGunpowder) {
	t.purpose = 1;
}
audio_play_sound_at(aBoom, x, y, z, 1, 1, 1, false, 0, global.sfxAudio)