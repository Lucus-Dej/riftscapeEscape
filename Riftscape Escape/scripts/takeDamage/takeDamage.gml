function enemyTakeDamage(_dmg, _source, _isDot = false) {
	if (instance_exists(_source)) {
		audio_listener_position(oTruePlayer.x, oTruePlayer.y, 0);
		audio_play_sound_at(aBoom, _source.x, _source.y, 0, 1, 1, 1, false, 0, global.sfxAudio)
		if (oItemManager.hasWaterDamagedNote && !_source.hasDamaged) {
			_dmg *= 1.4;
			_source.hasDamaged = true;
		}
		_source.enemey_hp -= _dmg;
		addDamageNumber(_source.x, _source.y, _dmg);
		_source.flash = 1;
	}
	if (_source.enemey_hp <= 0) {
		oPlayerManager.lastKilled = _source
		oPlayerManager.lastKilledX = _source.x;
		oPlayerManager.lastKilledY = _source.y;
		if (oItemManager.hasMolotov) {
			show_debug_message("I AM MOLOTOVING SO GOOD")
			with (_source) {
				with (oEnemy) {
					var dist = point_distance(x, y, other.x, other.y);
					if (dist < 120) {
						callDOT(id, _dmg*2, 16, 12, dotType.fire, other);
					}
				}
			}
		}
		var overkill = _dmg - _source.enemey_hp;
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
		if (object_index == oSwordLife || object_index == oSwordFate || object_index == oSword) {
			if (oPlayerManager.hasSwordThought) {
				oPlayerManager.swordCooldownBonus = 22;
				oPlayerManager.swordCooldownBonusTime = 30;
			}
			if (_source.xp > 0) {
				oPlayerManager.swordKills++;
				oPlayerManager.swordDmgBonus = sqrt(oPlayerManager.swordKills)*1.3 - 1.2;
			}
		}
	}
}
function playerTakeDamage(_dmg) {
	if (oPlayerManager.iframes <= 0) {
		if (oPlayerManager.dodgeLifeBonus > 0) {
			oPlayerManager.dodgeLifeBonus -= _dmg;
		} else if (!oPlayerManager.inOverhealth || !oPlayerManager.hasOverhealthRune) {
			global.player_health -= _dmg;
			if (oItemManager.hasReflectiveGem && oItemManager.reflectiveGemLuckBonus > 12) {
				oItemManager.reflectiveGemLuckBonus--;
			}
		} else {
			oPlayerManager.overhealthTimer /= 3;
		}
		oTruePlayer.flash = 1.5;
		oPlayerManager.tookDamage = true;
		oPlayerManager.iframes = oPlayerManager.iframeTotal;
		
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