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
				if (dot.type == dotType.poison && oItemManager.hasAntidote) {
					dot.ticks--;
					dot.time =0;
					break;	
				}
				global.player_health -= dot.damage;
				oPlayer.flash = 1.4;
			}
			
			dot.ticks--;
			dot.time =0;
			
			if (variable_instance_exists(dot.target, "enemyHP")) {
				dot.target.flash = 1
				
				if (dot.target. enemyHP <= 0) {
					if (oItemManager.hasMolotov) {
						//show_debug_message("I AM MOLOTOVING SO GOOD")
						with (dot.target) {
							with (oEnemy) {
								var dist = point_distance(x, y, other.x, other.y);
								if (dist < 360) {
									callDOT(id, dot.damage*2, 16, 12, dotType.fire, other);
								}
							}
						}
					}
					if (instance_exists(dot.source) && dot.source.object_index == oDaggPestMinion) {
						with (oDaggPestMinion) {
							if (oItemManager.hasLostCrown) {
								pestPower++;
							}
							pestPower++;
						}
					}
					instance_destroy(dot.target)
					array_delete(dotArray, i, 1);
					if (dot.source == oSwordLife || dot.source == oSwordJab) {
						if (dot.target.xp > 0) {
							oPlayerManager.swordKills += 1;
							oPlayerManager.swordDmgBonus = sqrt(oPlayerManager.swordKills)*1.3 - 1.2;
						}
						if (oPlayerManager.hasSwordThought) {
							oPlayerManager.swordCooldownBonus = 12;
							oPlayerManager.swordCooldownBonusTime += 32;
						}
					}
				} else {
					if (dot.type == dotType.poison && oItemManager.hasRadioactiveMaterial) {
							var radioCheck = irandom_range(1, 8)+global.playerTime*0.2;
							if (radioCheck >= 8) {
								dot.ticks *= 1.4;
								dot.damage *= 1.1;
							}
						}
					if (dot.source == oSword) {
						enemyTakeDamage(dot.damage, dot.target, true, , damageType.sword)
					} else if (dot.source == oDodgeImpact) {
						enemyTakeDamage(dot.damage, dot.target, true, , damageType.dodge)
					} else {
						if (dot.target.object_index == oVirstBoss) {
							if (dot.type == dotType.poison && oItemManager.hasAntidote) {
								dot.ticks = 0;
								dot.time =0;
								dot.damage = 0;
								break;	
							}
						}
						var dmgType = damageType.dotBlood;
						switch (dot.type) {
							case dotType.fire:
							dmgType = damageType.dotFire;
							break;
							
							case dotType.blood:
							dmgType = damageType.dotBlood;
							break;
							
							case dotType.ice:
							dmgType = damageType.dotIce;
							break;
							
							case dotType.poison:
							dmgType = damageType.dotPois;
							break;
							
							
							
						}
						if (dot.type == dotType.ice && instance_exists(dot.target)) {
							with (dot.target) {
								if (array_get_index(slowTargetArray, dot.source) == -1) {
									array_push(slowArray,80);
									array_push(slowTargetArray, dot.source)
									array_push(slowTimerArray, dot.ticks*dot.delay);
									array_push(slowMaxTimerArray, dot.ticks*dot.delay);
								}
							}
						}
						
						enemyTakeDamage(dot.damage, dot.target, true, , dmgType)
						
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