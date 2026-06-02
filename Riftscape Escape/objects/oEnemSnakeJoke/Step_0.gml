event_inherited();
if (brainDead) {
    exit;
}
if (increaseTimer > 0) {
	increaseTimer--;
} else {
	increaseTimer = increaseCooldown;
	snakeAddBody();
	enemSpeed += 0.02;
}
if (!spawnedBody) {
	for (var i = 0; i < bodyCount; i++) {
		var body = instance_create_layer(x, y, "Instances", oEnemCentiBody);
		body.xp = 0;
		body.head = id;
		body.image_xscale = image_xscale;
		body.image_yscale = image_yscale;
		if (isBoss) {
			body.enemey_hp *= hpMult;
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
bite_timer--;



var playerDir = point_direction(x, y, oTruePlayer.x, oTruePlayer.y); 
image_angle = playerDir+90;




// countdown
path_timer--;


if (dragTimer > 0) {
    applyDrag(dragPower, dragDir, oWalls);
    dragTimer--;

    if (dragTimer <= 0) {
        path_timer = 0;
    }
}

if (path_timer <= 0) {
    path_timer = path_cooldown;
    pathfind(global.Grid, oTruePlayer, enemSpeed, id);
}