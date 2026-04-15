
if (variable_instance_exists(other, "invincible")) {
	 if (other.invincible) {
		ignoreEnemy = other; 
	 }
}

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
		if (oItemManager.hasUnstableEnergy && canSpread) {
			canSpread = false;
			var cap = 4;
			var doubleChance = irandom_range(1, 60)
			if (doubleChance+global.playerLife > 60) {
				cap = 7;
			}
			var inc = 360/3;
			var startingAng = irandom(360);
			for (var r = 0; r < cap; r++) {
				var unDir = startingAng + inc*r;
				var spreadShot = bulletFire(lastHit.x, lastHit.y, unDir, speed/2, damage/5, object_index, oTruePlayer);
				spreadShot.ignoreEnemy = hit;
				spreadShot.richCount = richCount;
				spreadShot.bounceNum = bounceNum;
				spreadShot.image_xscale = 0.75;
				spreadShot.image_yscale = 0.75;
				spreadShot.damagedList = ds_map_create();
				spreadShot.existance = existance/2;
				spreadShot.canSpread = canSpread;
				ds_map_copy(spreadShot.damagedList, damagedList);
			}
			
		}
        if (oItemManager.hasWaterDamagedNote && !hit.hasDamaged) {
            hit.enemey_hp -= 1.4 * damage;
        } else {
            hit.enemey_hp -= damage;
        }
		if (canLifesteal) {
			global.player_health += global.lifesteal+damage/6;
		}
		z = 0;
audio_listener_position(x, y, z);
audio_play_sound_at(aBoom, x, y, z, 1, 1, 1, false, 0, global.sfxAudio)
        if (hit.enemey_hp <= 0) {
            oPlayerManager.lastKilled = hit.id;
            instance_destroy(hit);
            global.playerKilled = true;
			if (object_index == oSwordLife) {
				if (oPlayerManager.hasSwordThought) {
					oPlayerManager.swordCooldownBonus = 22;
					oPlayerManager.swordCooldownBonusTime = 30;
				}
			}
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
			if (closest != noone && instance_exists(closest)) {

				var dir = point_direction(x, y, closest.x, closest.y);

				var richBullet = bulletFire(x, y, dir, speed, damage/2, object_index, oTruePlayer)
				richBullet.ignoreEnemy = hit;
				richBullet.richCount = richCount;
				richBullet.bounceNum = bounceNum;
				richBullet.canSpread = canSpread;
				

				richBullet.damagedList = ds_map_create();
				ds_map_copy(richBullet.damagedList, damagedList);
			}
		}
		 if (!oPlayerManager.canPierce) {
            instance_destroy();
        }
		if (oItemManager.hasBrokenBoomerang) {
			startReset = true;
		}
    }
}
