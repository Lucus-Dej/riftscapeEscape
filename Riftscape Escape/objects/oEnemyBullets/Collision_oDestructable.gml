other.obHP -= damage;
if (other.obHP <= 0) {
	instance_destroy(other);
}
if (other.id == ignoreWall) {
	exit;
}
if (!canBounce) {
	instance_create_layer(x, y, "Instances", oBoom);
	instance_destroy();
	audio_play_sound_at(aBoom, x, y, 0, 1, 1, 1, false, 0, global.sfxAudio)
} else {
	// mark the wall that it bounced from via other.id
	ignoreWall = other.id;
	
	if (bounceTarget == noone || !instance_exists(bounceTarget)) {
		
	var vx = lengthdir_x(speed, direction);
	var vy = lengthdir_y(speed, direction);
	
	if (abs(x - other.x) > abs(y - other.y)) {
		vx *= -1;
	} else {
		vy *= -1;
	}
		newDir = point_direction(0,0,vx,vy);
	} else {
		var tx = bounceTarget.x;
		var ty = bounceTarget.y;
		
		var tvx = lengthdir_x(bounceTarget.speed, bounceTarget.direction);
		var tvy = lengthdir_y(bounceTarget.speed, bounceTarget.direction);
		
		var dist = point_distance(x, y, tx, ty);
		var t = dist / speed;
		
		var leadx = tx + tvx * t;
		var leady = ty + tvy * t;
		
		var aimx = lerp(tx, leadx, tracking);
		var aimy = lerp(ty, leady, tracking);
		
		newDir = point_direction(x, y, aimx, aimy);
	}
	// summon secondary projectile with everything this projectile has
	var nx = x + lengthdir_x(2, newDir);
	var ny = y + lengthdir_y(2, newDir);
	
	var copy = bulletFire(nx, ny, newDir, speed, damage, object_index, owner);
	copy.ignoreWall = ignoreWall;
	instance_destroy()
}

