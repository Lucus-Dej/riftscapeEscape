if (bossEgg) {
	sprite_index = sBossPortal;
}
var temp = instance_create_layer(0, 0, "Instances", enemHatchling, {image_alpha: 0, tempEnem: true, xp: 0, egg: id})
with (Manager) {
	if (object_index == oRoomManager) {
		if (other.bossEgg) {
			diffPool -= other.diff*4;
		} else {
			diffPool -= other.diff;
		}
	} else if (object_index == oWavebasedManager) {
		if (other.bossEgg) {
			waveWeight -= other.diff*4;
		} else {
			waveWeight -= other.diff;
		}
		
	}
	
}