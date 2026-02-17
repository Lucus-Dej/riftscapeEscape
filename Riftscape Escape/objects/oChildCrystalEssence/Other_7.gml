boom = instance_create_layer(x, y, "Instances", oChildCrystalBoomEssence);
boom.chainDistance = chainDistance;
audio_play_sound_at(aPlayerBoom, x, y, 0, 1, 1, 1, false, 0)
instance_destroy();
if (oPlayerManager.hasCrystalLife) {
	instance_create_layer(x, y, "Items", oCrystalLifeEffect)
}