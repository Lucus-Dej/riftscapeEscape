function snakeAddBody() {
	var body = instance_create_layer(x, y, "Instances", oEnemCentiBody);
	body. enemyHP =  enemyHP;
	body.xp = 0;
	body.head = id;
	body.image_xscale = image_xscale;
	body.image_yscale = image_yscale;

	if (isBoss) {
		body. enemyHP *= hpMult;
		body.maxHP *= hpMult;
	}

	if (array_length(bodyArray) > 0) {
		var tail = bodyArray[array_length(bodyArray) - 1];

		if (instance_exists(tail)) {
			body.follow = tail;

			
			body.x = tail.x;
			body.y = tail.y;
		} else {
			body.follow = id;
		}
	} else {
		body.follow = id;
	}

	array_push(bodyArray, body);
}