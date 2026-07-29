for (var i = 0; i < array_length(targetArray); i++) {
	var target = targetArray[i];
	if (instance_exists(target)) {
		instance_create_layer(target.x, target.y, "Instances", oLightningBolt);
	}
}