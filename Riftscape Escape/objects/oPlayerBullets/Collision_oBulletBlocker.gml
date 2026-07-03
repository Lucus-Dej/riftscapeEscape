if (!canBounce && bounceNum <= 0) {
	if (!oItemManager.hasMagnet) {
		instance_create_layer(x, y, "Instances", oBoom);
	instance_destroy();
	
	}
	
} else {
	
	// mark the wall that it bounced from via other.id
	ignoreWall = other.id;
	var searchRadius = 960;
	var closest = noone;
	var closestDist = 100000;
	bounceNum -= 1;
	if (tracking > 0)
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
			with (other) {
				collCheck = collision_line(other.x, other.y, x, closest.y, oBulletBlocker, true, false)
			}
			
		}
	if (bounceTarget == noone || !instance_exists(bounceTarget) || collCheck != noone) {	
		var vx = lengthdir_x(speed, direction);
		var vy = lengthdir_y(speed, direction);
	
			if (abs(x - other.x) > abs(y - other.y)) {
				vx *= -1;
			} else {
				vy *= -1;
			}
			newDir = point_direction(0,0,vx,vy);
			if (is_nan(newDir)) {
				newDir = direction; 
			}
		} else {
			var tx = bounceTarget.x;
			var ty = bounceTarget.y;
		
			var tvx = lengthdir_x(bounceTarget.speed, bounceTarget.direction);
			var tvy = lengthdir_y(bounceTarget.speed, bounceTarget.direction);
		
			var dist = point_distance(x, y, tx, ty);
			var t = 0;
			if (speed != 0) {
				t = dist / speed;
			} else {
				t = dist /0.01 ;
			}
		
			var leadx = tx + tvx * t;
			var leady = ty + tvy * t;
		
			var aimx = lerp(tx, leadx, tracking);
			var aimy = lerp(ty, leady, tracking);
		
			newDir = point_direction(x, y, aimx, aimy);
			if (is_nan(newDir)) {
				newDir = direction; 
			}
	}
	// summon secondary projectile with everything this projectile has
	var nx = x + lengthdir_x(2, newDir);
	var ny = y + lengthdir_y(2, newDir);
	var newSpeed = max(abs(speed), 0.01);
	if (oItemManager.hasDirtyMirror) {
		damage*= 1.1;
	} else {
		damage *= 0.9;
	}
	if (oItemManager.hasHeartPendent) {
		
		var copy = bulletFire(nx, ny, newDir+15, newSpeed*1.2, damage, object_index, self);
		copy.bounceNum = bounceNum;
		copy.canBounce = false;
		copy.ignoreWall = ignoreWall;
		copy.canSpread = canSpread;
		copy.image_blend = image_blend;
		copy.image_xscale = image_xscale;
		copy.turretApplied = turretApplied;
		copy.image_yscale = image_yscale;
		copy.damagedList = ds_map_create();
		copy.critShot = critShot;
		ds_map_copy(copy.damagedList, damagedList);
		newDir -= 15;
	}
	var copy = bulletFire(nx, ny, newDir, newSpeed*1.2, damage, object_index, self);
	copy.bounceNum = bounceNum;
	copy.boucned = true;
	copy.canSpread = canSpread;
	copy.canBounce = false;
	copy.ignoreWall = ignoreWall;
	copy.turretApplied = turretApplied;
	copy.critShot = critShot;
	copy.image_blend = image_blend;
	copy.image_xscale = image_xscale;
	copy.image_yscale = image_yscale;
	copy.damagedList = ds_map_create();
	ds_map_copy(copy.damagedList, damagedList);
	instance_destroy()
}
z = 0;
audio_listener_position(x, y, z);
audio_play_sound_at(aBoom, x, y, z, 1, 1, 1, false, 0, global.sfxAudio)
     