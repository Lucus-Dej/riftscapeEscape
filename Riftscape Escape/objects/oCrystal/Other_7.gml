boom = instance_create_layer(x, y, "Instances", oCrystalBoom);
if (oItemManager.hasIceCharm) {
	var startAng = 0;
	var inc = 60;
	for (var i = 0; i < 6; i++) {
		var snow = instance_create_layer(x, y, "Items", oSnowStorm)
		snow.direction = inc*i;
		snow.speed = 6;
	}
	instance_create_layer(x, y, "Items", oLightningCircle);
}
if (oPlayerManager.hasCrystalLife) {
	instance_create_layer(x, y, "Items", oCrystalLifeEffect)
}
audio_play_sound_at(aPlayerBoom, x, y, 0, 1, 1, 1, false, 0, global.sfxAudio)
instance_destroy();