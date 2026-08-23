function enemyTakeDamage(_dmg, _source, _isDot = false, _trueDmg = false, _type = damageType.basic) {
	if (_source.invincible) {
		return;
	}
	var cancelKill = false;
	var dot = false;
	if (_type == damageType.dotFire || _type == damageType.dotBlood || _type == damageType.dotPois || _type == damageType.dotIce) {
		dot = true;
	}
	if (instance_exists(_source)) {
		// charm checks
		if (oItemManager.hasLightningCharm && _type == damageType.dotLightning || _type ==  damageType.playerLightning) {
			_dmg *= 1.5;
		}
		if (oItemManager.hasFireCharm && _type == damageType.dotFire || _type == damageType.playerFire) {
			_dmg *= 1.5;
		}
		if (oItemManager.hasIceCharm && _type == damageType.dotIce || _type == damageType.playerIce) {
			_dmg *= 1.5;
		}
		if (oItemManager.hasBloodCharm && _type == damageType.dotBlood || _type ==  damageType.playerBlood) {
			_dmg *= 1.5;
		}
		if (oItemManager.hasPoisonCharm && _type == damageType.dotPois || _type ==  damageType.playerPois) {
			_dmg *= 1.5;
		}
		if (oItemManager.hasBloodCharm) {
			var bloodCheck = irandom_range(1, 12) + global.playerTime * 0.6;
			if (bloodCheck >= 12) {
				var spill = instance_create_layer(_source.x+random_range(-32, 32), _source.y+random_range(-32, 32), "Items", oBloodSpill)
				spill.dmg = _dmg*0.05;
				var scale = random_range(0.5, 2);
				scale = (_source.image_xscale*0.5)*scale;
				spill.image_xscale = scale;
				spill.image_yscale = scale;
			}
		}
		if (oPlayerManager.lastDamaged == _source) {
			if (oItemManager.hasOilBarrel && instance_exists(oVirstBoss)) {
			var barrelCheck = irandom_range(1, 8);
			if (barrelCheck >= 6) {
				with (oVirstBoss) {
					var enemDistCheck = 240;
					
					with (oTruePlayer) {
						var enemDist = point_distance(x, y, oVirstBoss.x, oVirstBoss.y);
						if (enemDist <= enemDistCheck) {
							callDOT(self, 0.65, 8, 12, dotType.fire, other);
						}
					}
				}
			}
		}
			if (oItemManager.hasYin) {
				oItemManager.yinFireRateBonus++;
				oItemManager.effectiveYinBonus = sqrt(oItemManager.yinFireRateBonus) * 0.4;
			}
			if (oItemManager.hasYang) {
				oItemManager.yangDmgBonus = 0;
				oItemManager.effectiveYangBonus = 0;
			}
		}
		if (oPlayerManager.lastDamaged != _source) {
			 if (oItemManager.hasYang && oItemManager.yangDmgBonus < 10) {
				 oItemManager.yangDmgBonus++;
				oItemManager.effectiveYangBonus = sqrt(oItemManager.yangDmgBonus * 0.8) * 0.16;
			}
			if (oItemManager.hasYin) {
				oItemManager.yinFireRateBonus = 0;
				oItemManager.effectiveYinBonus = 0;
			}
		} 
		if (oItemManager.hasRifterBloodSample) {
			if (_type == damageType.dotBlood) {
				healPlayer(_dmg*6, true);
			} else if (_type == damageType.playerBlood) {
				healPlayer(_dmg*2, true);
			}
			
		}
		if (oItemManager.hasBottleOil) {
			with (_source) {
				if (place_meeting(x, y, oOilSpill) && (_type == damageType.playerFire || _type == damageType.dotFire)) {
					_dmg *= 2;
				}
			}
		}
		oPlayerManager.lastDamaged = _source;
		var typeCheck = array_get_index(_source.damagedByArray, _type);
		if (typeCheck == -1) {
			array_push(_source.damagedByArray, _type)
		}
		audio_listener_position(oTruePlayer.x, oTruePlayer.y, 0);
		//audio_play_sound_at(aBoom, _source.x, _source.y, 0, 1, 1, 1, false, 0, global.sfxAudio)
		if (_source.perfectParryTimer > 0 && _type == damageType.sword) {
			audio_play_sound(aParry, 2, false, global.sfxAudio);
			initPerfectParry();
		}
		if (oItemManager.hasWaterDamagedNote && !_source.hasDamaged) {
			_dmg *= 1.4;
			_source.hasDamaged = true;
		}
		if (_dmg < 0.01) {
			_dmg = 0.01;
		}
		_source.enemyHP -= _dmg;
		addDamageNumber(_source.x, _source.y, _dmg,,,,_source.id);
		_source.flash = 1;
		
	}
	if (_source.object_index == oVirstBoss) {
		if (_source. enemyHP <= 0 && instance_exists(oTetheredSoulEvil)) {
			show_debug_message("TRYING TO SAVE THEM")
			show_debug_message(_source. enemyHP)
			_source. enemyHP = _source.maxHP;
			show_debug_message(_source. enemyHP)
			instance_destroy(oTetheredSoulEvil)
			cancelKill = true;
		}
		if (_source. enemyHP <= 0 && oItemManager.hasVirstEssence && !_source.savedByVirstEssence) {
			show_debug_message("TRYING TO SAVE THEM")
			show_debug_message(_source. enemyHP)
			_source. enemyHP = _source.maxHP;
			show_debug_message(_source. enemyHP)
			_source.savedByVirstEssence = true;
			_source.baseShootDelay /= 2;
			_source.image_xscale += 1;
			_source.image_yscale += 1;
			itemRemove(oVirstEssence)
			cancelKill = true;
		}
		if (oPlayerManager.hasBrainInAJar) {
			var brainNum = irandom_range(1, 6);
			if (brainNum != 6) {
				_source.brainReduction += 60;
				if (_source.brainReduction > _source.baseShootDelay*0.95) {
					_source.brainReduction = _source.baseShootDelay*0.95;
				}
			}
		}
	}
	if (_source. enemyHP <= 0 && !_source.sub && !cancelKill) {
		oPlayerManager.lastKilled = _source;
		oPlayerManager.lastKilledX = _source.x;
		oPlayerManager.lastKilledY = _source.y;
		if (oPlayerManager.hasEssenceHusk && (instance_exists(oHuskLife) || instance_exists(oMindHusk))) {
			instance_create_layer(oPlayerManager.lastKilledX, oPlayerManager.lastKilledY, "Instances", oHuskInvisPickup)
		}
		if (_type == damageType.dotLightning || _type == damageType.playerLightning) {
			instance_create_layer(oPlayerManager.lastKilledX, oPlayerManager.lastKilledY, "Instances", oLightningCircle)
		}
	
		
		if (instance_exists(oElementalAura)) {
			with (oElementalAura) {
				if (existence < existenceTot) {
					existence += existOnKill;
					if (dot) {
						existence += existOnKill;
					}
				} else {
					existence += existOnKill*0.2;
					if (dot) {
						existence += existOnKill*0.1;
					}
				}
			}
		} else {
			oItemManager.elementalAuraPoints += oItemManager.elementalAuraPointsOnKill;
		}
		if (oItemManager.hasBloodCharm) {
			
			for (var i = 0; i < 4; i++) {
				var spill = instance_create_layer(_source.x+random_range(-16, 16), _source.y+random_range(-16, 16), "Items", oBloodSpill)
				spill.dmg = _dmg*0.2;
				var scale = random_range(0.75, 2);
				scale = (_source.image_xscale)*scale*0.75;
				spill.image_xscale = scale;
				spill.image_yscale = scale;
			}
			
		}
		if (oItemManager.hasHorseDeath && _trueDmg) {
			with (oSyDeathMinion) {
				if (oItemManager.hasLostCrown) {
					deathPowerKills += 0.25;
				}
				deathPowerKills++;
			}
		}
		if (oPlayerManager.hasDodgeFate && _type == damageType.dodge) {
			instance_create_layer(oPlayerManager.lastKilledX, oPlayerManager.lastKilledY, "Instances", oDodgeImpact)
		}
		if (oItemManager.hasMolotov && dot) {
			with (_source) {
				with (oEnemy) {
					var dist = point_distance(x, y, other.x, other.y);
					if (dist < 140) {
						callDOT(id, _dmg*2, 16, 12, dotType.fire, other);
					}
				}
			}
		}
			if (_source.isBoss) {
				if (_source.checkCircleFlag) {
					if (instance_exists(oCricleOfFate)) {
						with (oCricleOfFate) {
							if (!playerLeftCircle) {
								global.meta.challenges.beatBossWhileInisdeCircle = true;
							}
						}
					}
				}
				if (array_length(_source.damagedByArray) == 1) {
					var dmgCheck = _source.damagedByArray[0];
					if (dmgCheck == damageType.torzMinion) {
						global.meta.challenges.beatBossWithOnlyMinion = true;
					}
					
					if (dmgCheck == damageType.dodge) {
						global.meta.challenges.beatBossWithOnlyDodge = true;
					}
					
					if (dmgCheck == damageType.husk) {
						global.meta.challenges.beatBossWithOnlyHusk = true;
					}
					
					if (dmgCheck == damageType.sword) {
						global.meta.challenges.beatBossWithOnlySword = true;
					}
					
					if (dmgCheck == damageType.bomb) {
						global.meta.challenges.beatBossWithOnlyBomb = true;
					}
				}
			}
		var overkill = _dmg - _source. enemyHP;
		var xp = _source.xp;
		instance_destroy(_source);
		global.playerKilled = true;
		if (oItemManager.hasHauntedGravestone) {
			var ghost = instance_create_layer(oPlayerManager.lastKilledX, oPlayerManager.lastKilledY, "Instances", oGravestoneGhost);
		if (oItemManager.hasLostCrown) {
			ghost.damage += overkill*1.2;
		} else {
			ghost.damage += overkill*1.05;
			}
		}
		if (_type == damageType.sword) {
			if (oPlayerManager.hasSwordThought) {
				oPlayerManager.swordCooldownBonus = 22;
				oPlayerManager.swordCooldownBonusTime = 30;
			}
			if (xp > 0) {
				oPlayerManager.swordKills++;
				oPlayerManager.swordDmgBonus = sqrt(oPlayerManager.swordKills)*1.3 - 1.2;
			}
		}
	}
}
function playerTakeDamage(_dmg, _type = damageType.basic) {
	if (oPlayerManager.iframes <= 0) {
		if (instance_exists(oJavWarMinion)) {
			with (oJavWarMinion) {
				warPowerDmg++;
				delay = cooldown;
			}
		}
		if (_type = damageType.contact && oItemManager.hasKrostEssence) {
			_dmg *= 0.5;
		}
		if (oItemManager.hasWaterDamagedNote && instance_exists(oVirstBoss) && object_index == oVirstBullet && !oTruePlayer.hasDamaged) {
			_dmg *= 1.4;
			oTruePlayer.hasDamaged = true;
		}
		global.damageCheck = true;
		if (oPlayerManager.dodgeLifeBonus > 0) {
			oPlayerManager.dodgeLifeBonus -= _dmg;
			addDamageNumber(312+irandom_range(-3, 3), 64+irandom_range(-3, 3), _dmg, c_white, , true, oTruePlayer.id);
		} else if (oPlayerManager.inOverhealth) {
			addDamageNumber(312+irandom_range(-3, 3), 64+irandom_range(-3, 3), oPlayerManager.overhealthTimer/3, c_aqua, , true, oTruePlayer.id);
			oPlayerManager.overhealthTimer /= 3;
			
		} else {
			global.player_health -= _dmg;
			addDamageNumber(312+irandom_range(-3, 3), 64+irandom_range(-3, 3), _dmg, c_white, , true, oTruePlayer.id);
			if (oItemManager.hasReflectiveGem) {
				if  (oItemManager.reflectiveGemLuckBonus > 0) {
					oItemManager.reflectiveGemLuckBonus -= 0.05;
				}
			}
		}
		oTruePlayer.flash = 1.5;
		oPlayerManager.tookDamage = true;
		oPlayerManager.iframes = oPlayerManager.iframeTotal;
		if (oItemManager.hasPlasmaOrb && _type == damageType.contact) {
			var orbCheck = irandom_range(1, 3);
			if (orbCheck + global.playerTime*0.2 >= 3) {
				var target = instance_nearest(x, y, oEnemy);
				var bolt = instance_create_layer(x, y, "Items", oLightningBolt);
				bolt.damage = _dmg/10;
			}
		}
		if (oItemManager.hasOilBarrel) {
			var barrelCheck = irandom_range(1, 8);
			if (barrelCheck + global.playerTime*0.5 >= 8) {
				with (oTruePlayer) {
					var enemDistCheck = 240;
					
					with (oEnemy) {
						var enemDist = point_distance(x, y, oTruePlayer.x, oTruePlayer.y);
						if (enemDist <= enemDistCheck) {
							callDOT(self, 0.065, 8, 12, dotType.fire, other);
						}
					}
				}
			}
		}
		if (oItemManager.hasD2) {
			var rollCheck = irandom_range(1, 2);
			if (rollCheck == 2) {
				var itemLength = array_length(oItemManager.itemList)-1;
				var itemIndex = irandom(itemLength);
				var foundItem = oItemManager.itemList[itemIndex];
				itemRemove(foundItem);
				var rarity = findItemRarity(foundItem);
				refreshItem(rarity, foundItem);
				var newItem = rollItem(true);
				itemAdd(newItem);
				if (foundItem == oD2) {
					rarity *= 2;
				}
				oItemManager.luckBonus += rarity;
			}
		}
	} 
	if (global.player_health <= 0 && !oPlayerManager.inOverhealth) {
		playerDied();
	}
}
function playerKilledEnemy () {
	
}
function playerDied () {
	
}