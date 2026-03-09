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
        if (oItemManager.hasWaterDamagedNote && !hit.hasDamaged) {
            hit.enemey_hp -= 1.25 * damage;
        } else {
            hit.enemey_hp -= damage;
        }
		if (canLifesteal) {
			global.player_health += global.lifesteal;
		}
		z = 0;
audio_listener_position(x, y, z);
audio_play_sound_at(aBoom, x, y, z, 1, 1, 1, false, 0)
        if (hit.enemey_hp <= 0) {
            oPlayerManager.lastKilled = hit.id;
            instance_destroy(hit);
            global.playerKilled = true;
			if (object_index == oSwordLife) {
				if (oPlayerManager.hasSwordThought) {
					oPlayerManager.swordCooldownBonus = 12;
					oPlayerManager.swordCooldownBonusTime = 30;
				}
			}
        }

        // RICOCHET
       if (oPlayerManager.canRich && richCount > 0 && oPlayerManager.hasMinionFate) {
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

				richBullet.damagedList = ds_map_create();
				ds_map_copy(richBullet.damagedList, damagedList);
			}
		}
		 if (!oPlayerManager.canPierce) {
            instance_destroy();
        }
    }
}
