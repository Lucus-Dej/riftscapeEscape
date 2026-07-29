event_inherited();

if (!spawnedBody) {
	for (var i = 0; i < bodyCount; i++) {
		var body = instance_create_layer(x, y, "Instances", oEnemCentiBody);
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
if (bite_timer < -1*shoot_delay/2) {
	bite_timer = irandom(shoot_delay);
}
if (bite_timer <= 0 && on_cooldown = true) {
	on_cooldown = false;
}