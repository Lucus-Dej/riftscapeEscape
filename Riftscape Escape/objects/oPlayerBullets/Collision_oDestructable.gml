if (ignoreWall != other) {
	if (oItemManager.hasHammer) {
		other.obHP -= damage*8;
	} else {
		other.obHP -= damage;
	}
	
}
if (!canBounce && bounceNum  <= 0) {
	
	instance_create_layer(x, y, "Instances", oBoom);
	instance_destroy();
	audio_play_sound_at(aBoom, x, y, 0, 1, 1, 1, false, 0, global.sfxAudio)
} else {
	// mark the wall that it bounced from via other.id
	ignoreWall = other.id;
	var searchRadius = 960;
	var closest = noone;
	var closestDist = 100000;
	bounceNum -= 1;
	with (oEnemy) {
		// Skip enemies already damaged
		if (ds_map_exists(other.damagedList, id)) {
			continue;
		}
		var d = point_distance(other.x, other.y, x, y)
			if (d < searchRadius && d < closestDist) {
				closestDist = d;
				closest = id;
			}
		}
		if (closest != noone && instance_exists(closest)) {
			bounceTarget = closest;
		}
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
	var newSpeed = abs(speed);
	var copy = bulletFire(nx, ny, newDir, newSpeed*1.2, damage*0.8, object_index, oTruePlayer);
	copy.bounceNum = bounceNum;
	copy.canBounce = false;
	copy.ignoreWall = ignoreWall;
	copy.canSpread = canSpread;
	copy.damagedList = ds_map_create();
	ds_map_copy(copy.damagedList, damagedList);
	instance_destroy()
}
z = 0;
audio_listener_position(x, y, z);
audio_play_sound_at(aBoom, x, y, z, 1, 1, 1, false, 0, global.sfxAudio)


if (other.obHP <= 0) {
	instance_destroy(other);
}
