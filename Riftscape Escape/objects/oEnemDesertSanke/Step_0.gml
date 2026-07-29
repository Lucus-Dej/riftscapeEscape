event_inherited();
if (!spawnedBody) {
	for (var i = 0; i < bodyCount; i++) {
		var body = instance_create_layer(x, y, "Instances", oEnemDesertSnakeBody);
		body.xp = 0;
		body.head = id;
		body.image_xscale = image_xscale;
		body.image_yscale = image_yscale;
		if (isBoss) {
			body. enemyHP *= hpMult;
			body.maxHP *= hpMult;
		}
		if (i == 0) {
			body.follow = id;
		} else {
			body.follow = bodyArray[i-1];
		}
		array_push(bodyArray, body);
	}
	spawnedBody = true;
}
if (brainDead) {
    exit;
}

bite_timer--;

if (bite_timer > 0) {
	var playerDir = point_direction(x, y, oTruePlayer.x, oTruePlayer.y); 
	
	image_angle = playerDir+90;
} 
var playerDist = point_distance(x, y, oTruePlayer.x, oTruePlayer.y); 
if (playerDist < 88 && dashTimer > 0) {
	dashTimer--;
	enemSpeed = 4.5;
} else {
	bite_timer = shoot_delay;
	dashTimer = dashDuration;
	enemSpeed = initalSpeed;
}