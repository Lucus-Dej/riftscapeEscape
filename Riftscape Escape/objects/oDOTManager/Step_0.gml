if (array_length(dotArray) > 0) {
	for (var i = array_length(dotArray) - 1; i >= 0; i--) {
		var dot = dotArray[i];
		if (!instance_exists(dot.target)) {
			array_delete(dotArray, i, 1);
			continue;
		}
		dot.time++;
		if (dot.time >= dot.delay) {
			dot.target.enemey_hp -= dot.damage;
			dot.target.flash = 1
			dot.ticks--;
			dot.time =0;
			dotArray[i] = dot;
			if (dot.target.enemey_hp <= 0) {
				instance_destroy(dot.target)
				array_delete(dotArray, i, 1);
			}
		}
		if (dot.ticks <= 0)  {
			array_delete(dotArray, i, 1);
		}
	}
}