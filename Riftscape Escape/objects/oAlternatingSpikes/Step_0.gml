if (active) {
	if (flash > 0) {
		flash -= 0.5;
	}
	if (timer > 0) {
		timer --;
		if (timer == 12) {
			flash = 0.6;
		}
	} else {
		if (!swap)
		if (instance_exists(child_coll)) {
			instance_destroy(child_coll)
		} else {
			child_coll = instance_create_layer(x, y, "Instances", oColl);
		}
		swap = !swap;
		timer = cooldown;
	}
	if (swap && active) {
		image_index = 1;
	} else if (!swap && active) {
		image_index = 0;
	} else {
		image_index = 0;
	}
}

