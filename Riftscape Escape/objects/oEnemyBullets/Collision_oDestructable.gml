instance_create_layer(x, y, "Instances", oBoom);

other.obHP -= damage;
if (other.obHP <= 0) {
	instance_destroy(other);
}

instance_destroy();
z = 0;
audio_play_sound_at(aBoom, x, y, z, 1, 1, 1, false, 0)