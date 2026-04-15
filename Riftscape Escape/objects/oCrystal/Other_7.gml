boom = instance_create_layer(x, y, "Instances", oCrystalBoom);
if (oPlayerManager.hasCrystalReality) {
	boom.goUp = true;
	boom.goLeft = true;
	boom.goDown = true;
	boom.goRight = true;
	boom.chainDistance = chainDistance;
} else {
	boom.goUp = false;
	boom.goLeft = false;
	boom.goDown = false;
	boom.goRight = false;
	boom.chainDistance = 0;
}
if (oPlayerManager.hasCrystalLife) {
	instance_create_layer(x, y, "Items", oCrystalLifeEffect)
}
audio_play_sound_at(aPlayerBoom, x, y, 0, 1, 1, 1, false, 0, global.sfxAudio)
instance_destroy();