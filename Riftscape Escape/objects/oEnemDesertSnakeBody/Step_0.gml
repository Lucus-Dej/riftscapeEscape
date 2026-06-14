event_inherited();
if (brainDead) {
    exit;
}
bite_timer--; 

// countdown
path_timer--;
if (instance_exists(head)) {
	enemSpeed = head.enemSpeed;
	if (enemey_hp < head.enemey_hp) {
		var dmgDiff = head.enemey_hp - enemey_hp;
		enemyTakeDamage(dmgDiff/2, head);
	}
	enemey_hp = head.enemey_hp;
} else {
	instance_destroy();
}

if (dragTimer > 0) {
    applyDrag(dragPower, dragDir, oWalls);
    dragTimer--;

    if (dragTimer <= 0) {
        path_timer = 0;
    }
}
if (instance_exists(follow)) {
	var playerDir = point_direction(x, y, follow.x, follow.y); 
	image_angle = playerDir+90;
	var targetDist = 10;

	var dir = point_direction(x, y, follow.x, follow.y);
	var dist = point_distance(x, y, follow.x, follow.y);

	if (dist > targetDist) {
		x = follow.x - lengthdir_x(targetDist, dir);
		y = follow.y - lengthdir_y(targetDist, dir);
	}
}
/*
if (path_timer <= 0) {
    path_timer = path_cooldown;
    pathfind(global.Grid, follow, enemSpeed, id);
}