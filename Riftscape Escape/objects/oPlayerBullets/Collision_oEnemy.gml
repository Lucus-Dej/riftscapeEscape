
if (variable_instance_exists(other, "invincible")) {
	 if (other.invincible) {
		exit; 
	 }
}
var parent = object_get_parent(other.object_index);
if (ignoreEnemy != other) {
    var hit = other;
	lastHit = hit;
if (!ds_exists(damagedList, ds_type_map)) {
	damagedList = ds_map_create();
}
    if (!ds_map_exists(damagedList, hit.id)) {
        ds_map_add(damagedList, hit.id, true);

        oPlayerManager.lastKilledX = hit.x;
        oPlayerManager.lastKilledY = hit.y;
		other.flash = 1;
		if (oItemManager.hasUnstableEnergy && canSpread && spreadCount > 0 && parent != oSubEnemy) {
			//canSpread = false;
			spreadCount--;
			var cap = 3;
			var doubleChance = irandom_range(1, 60)
			if (doubleChance+global.playerTime > 60) {
				cap = 6;
			}
			var inc = 360/cap-1;
			var startingAng = irandom(360);
			for (var r = 0; r < cap; r++) {
				var unDir = startingAng + inc*r;
				var spreadShot = bulletFire(lastHit.x, lastHit.y, unDir, speed/2, damage/5, object_index, self);
				spreadShot.ignoreEnemy = hit;
				spreadShot.richCount = richCount;
				spreadShot.bounceNum = bounceNum;
				spreadShot.critShot = critShot;
				spreadShot.image_xscale *= 0.75;
				spreadShot.image_yscale *= 0.75;
				spreadShot.image_blend = image_blend;
				spreadShot.damagedList = ds_map_create();
				spreadShot.existance = existance*0.5;
				spreadShot.spreadCount = spreadCount;
				ds_map_copy(spreadShot.damagedList, damagedList);
			}
			
		} 
		if (critShot && oItemManager.hasMolotov) {
			callDOT(other, 0.25, 8, 12, dotType.fire, oTruePlayer);
		}
		if (oItemManager.hasBrokenSnowglobe) {
			damage += speedBonus;
		}
		enemyTakeDamage(damage, hit);
		if (canLifesteal) {
			global.player_health += global.lifesteal;
		}
        // RICOCHET
       if (oPlayerManager.canRich && richCount > 0) {
		   richCount--;
		   var searchRadius = 960;
		   var closest = noone;
		   var closestDist = 100000;

			with (oEnemy) {
				if (id == other.lastHit) {
					continue;
				}
				// Skip enemies already damaged
				if (ds_map_exists(other.damagedList, id)) {
					continue;
				}
				var d = point_distance(other.x, other.y, x, y);

				if (d < searchRadius && d < closestDist) {
					closestDist = d;
					closest = id;
				}
			}
			
			if (closest != noone && instance_exists(closest) && parent != oSubEnemy) {

				var dir = point_direction(x, y, closest.x, closest.y);

				var richBullet = bulletFire(x, y, dir, speed, damage/2, object_index, self);
				richBullet.spreadCount = spreadCount;
				richBullet.critShot = critShot;
				richBullet.ignoreEnemy = hit;
				richBullet.richCount = richCount;
				richBullet.bounceNum = bounceNum;
				richBullet.canSpread = canSpread;
				richBullet.image_xscale *= 0.75;
				richBullet.image_yscale *= 0.75;
				richBullet.image_blend = image_blend;
				richBullet.turretApplied = turretApplied;
				richBullet.damagedList = ds_map_create();
				ds_map_copy(richBullet.damagedList, damagedList);
			}
		}
		 if (!oPlayerManager.canPierce) {
            instance_destroy();
        }
		
    }
}
