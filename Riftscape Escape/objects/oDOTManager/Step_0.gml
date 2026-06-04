if (array_length(dotArray) > 0) {
	for (var i = array_length(dotArray) - 1; i >= 0; i--) {
		var dot = dotArray[i];
		if (!instance_exists(dot.target)) {
			array_delete(dotArray, i, 1);
			continue;
		}
		dot.time++;
		if (dot.time >= dot.delay) {
			if (dot.target.object_index == oTruePlayer) {
				global.player_health -= dot.damage;
				oPlayer.flash = 1.4;
			}
			
			dot.ticks--;
			dot.time =0;
			
			if (variable_instance_exists(dot.target, "enemey_hp")) {
				dot.target.flash = 1
				dot.target.enemey_hp -= dot.damage;
				addDamageNumber(dot.target.x, dot.target.y, dot.damage);
				if (dot.target.enemey_hp <= 0) {
					if (dot.type == dotType.fire && oItemManager.hasMolotov) {
						with (dot.target) {
							with (oEnemy) {
								var dist = point_distance(x, y, other.x, other.y);
								if (dist < 320) {
									callDOT(id, dot.damage*2, 8, 12, dotType.fire, other);
								}
							}
						}
					}
					instance_destroy(dot.target)
					array_delete(dotArray, i, 1);
					if (dot.source == oSwordLife) {
						if (dot.target.xp > 0) {
							oPlayerManager.swordKills += 1;
							oPlayerManager.swordDmgBonus = sqrt(oPlayerManager.swordKills)*1.3 - 1.2;
						}
						if (oPlayerManager.hasSwordThought) {
							oPlayerManager.swordCooldownBonus = 12;
							oPlayerManager.swordCooldownBonusTime += 32;
						}
					}
				}
			}	
		}
		dotArray[i] = dot;
		if (dot.ticks <= 0)  {
			array_delete(dotArray, i, 1);
		}
	}
}