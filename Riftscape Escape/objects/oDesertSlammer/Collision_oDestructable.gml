
if (state == ENEM_STATE.CHARGE) {
instance_create_layer(x, y, "Instances", oBoom)
audio_play_sound_at(aBoom, x, y, 1, 1, 1, 1, false, 1);
instance_destroy(other);
}