if (state == waveState.idle && RoomID != -1) {
	if (!spawnChecked) {
		with (oEnemStart) {
			if (RoomID == other.RoomID) {
				array_push(other.spawnerArray, id)
			}
		}
		with (oItemFlag) {
			if (RoomID == other.RoomID) {
				Manager = other.id;
				other.itemSpawner = id;
			}
		}
		with (oRoomManager) {
			if (RoomID == other.RoomID) {
				other.roomManager = id;
				global.flyGrid = mp_grid_create(claimX,claimY, (claimX2 - claimX)/ 32, (claimY2-claimY)/32, 32, 32);
			}
		}
		spawnChecked = true;
		
	}
}
if (state == waveState.generatingWave) {
	for (var f = 0; f < array_length(waveArray); f++) {
		
	}
}
if (state == waveState.spawning) {
	if (isLimited && limitedWaveDoorSet) {
		powerDoor(RoomID);
		limitedWaveDoorSet = true;
	}
	if (!gendFlyGrid)
	with (roomManager) {
		global.flyGrid = mp_grid_create(claimX,claimY, (claimX2 - claimX)/ 32, (claimY2-claimY)/32, 32, 32);
		global.Grid = mp_grid_create(claimX,claimY, (claimX2 - claimX)/ 32, (claimY2-claimY)/32, 32, 32);
	}
	enemiesLeft = instance_number(oEnemy);
	enemString = "Enemies Left: "+string(enemiesLeft);
	inCombat = true; 
	with (oEnemyTurrets) {
		if (RoomID == other.RoomID && levelReq <= other.wave) {
			if (!active) {
				active = true;
				if (object_index == oEnemyTurretsRandSpawner) {
					event_user(0);
				}
			}
		}
	}
	if (waveWeight > 0) {
		if (spawnCooldown > 0) {
			spawnCooldown--;
		}
		if (spawnCooldown <= 0) {
			var f = irandom(array_length(spawnerArray)-1)
			var spawner = spawnerArray[f];
			var pull = noone;
			if (!bossRound) {
				var i = irandom(array_length(waveArray)-1)
				pull = waveArray[i];
			} else {
				var i = irandom(array_length(bossArray)-1)
				pull = bossArray[i];
			}
			var enem = noone;
			with (spawner) {
				if (global.difficulty == 1) {
					enem = spawnEnemViaEgg(24, pull, other.bossRound, false, RoomID, other, id)
				} else if (global.difficulty == 2 ) {
					enem = spawnEnemViaEgg(12, pull, other.bossRound, false, RoomID, other, id)
				} else if (global.difficulty >= 3) {
					enem = spawnEnemViaEgg(6, pull, other.bossRound, false, RoomID, other, id)
				}
				//var enem = instance_create_layer(x, y, "Instances", pull);
			}
			spawnCooldown = spawnDelay
		}
	} else if (!instance_exists(oEnemy) && !instance_exists(oEnemPortalEgg)) {
		if (!runeRound && instance_exists(oRuneSpawner) && !restrictedArrays) {
			instance_destroy(oRuneSpawner)
		}
		with (oEnemyTurrets) {
			if (RoomID == other.RoomID) {
				if (active) {
					active = false;
				}
			}
		}
		if (runeRound) {
			rollConsumable(id);
			var runeSpawner = noone;
			with (oRuneFlag) {
				runeSpawner = instance_create_layer(x, y, "Instances", oRuneSpawner);
			}
			runeSpawner.RoomID = RoomID;
			roundsTillRune = 10;
			runeRound = false;
		}
		if (itemRound) {
			rollConsumable(id);
			var item = rollItem(false);
			with (itemSpawner) {
				instance_create_layer(x, y, "Instances", item);
			}
			roundsTillItem = 10;
			itemRound = false;
		}
		if (bossRound) {
			startingWeight += bossBonus*2.5;
			bossBonus++;
			roundsTillBoss = 5;
			bossRound = false;
		}
		state = waveState.inBetween;
	}
}
if (state == waveState.inBetween) {
	inCombat = false;
	endOfCombatCheck()
	if (global.chargeItem != noone && global.currentCharges < global.itemCharges) {
		global.currentCharges += 1;
	}
	wave += 1;
	waveTxt = "Wave: "+string(wave);
	roundsTillBoss--;
	roundsTillItem--;
	roundsTillRune--;
	if (roundsTillBoss == 0) {
		bossRound = true;
	}
	if (roundsTillItem == 0) {
		itemRound = true;
	}
	if (roundsTillRune == 0) {
		runeRound = true;
	}
	if (!restrictedArrays)
	switch (wave) {
		case 1:
		array_push(waveArray, oEnemExplosiveSpider, oEnemCaveSpider)
		startingWeight += 2;
		break;
		
		case 2:
		array_push(waveArray, oEnemBat)
		break;
		
		case 4:
		array_push(waveArray, oCavesStoneGolem)
		break;
		
		case 5:
		array_push(waveArray, oEnemBigBat, oEnemMotherCaveSpider, oEnemExplosiveBat)
		break;
		
		case 6:
		array_push(waveArray, oEnemCentiHead)
		break;
		
		case 7:
		array_push(bossArray, oMiniBoss3, oEnemCentiHead)
		break;
		
		case 9:
		array_push(waveArray, oMiniBoss, oMiniBoss2)
		break;
		
		case 10:
		array_push(waveArray, oEnemDesertSanke)
		break;
		
		case 12:
		array_push(waveArray, oEnemDesertWasp);
		break;
		
		case 11:
		array_push(waveArray, oEnemDesertBiter)
		break;
		
		case 13:
		array_push(waveArray, oEnemMiniMummy, oEnemSandSniper)
		break;
		
		case 14:
		array_push(bossArray, oDesertSlammer)
		break;
		
		case 15:
		array_push(waveArray, oDesertSlammer)
		break;
		
		case 17:
		array_push(waveArray, oWaspHive)
		break;
		
		case 18:
		array_push(bossArray, oMummy, oWaspHive, oEnemMiniMummy)
		break;
		
		case 21:
		array_push(waveArray, oWastelandBurner, oRifterDrone)
		break;
		
		case 23:
		array_push(waveArray, oRifterSniper)
		break;
		
		case 24:
		array_push(bossArray, oBoss3, oWastelandFireRunner, oWastelandFireSpirit)
		break;
		
		case 26:
		array_push(waveArray, oWastelandFireRunner)
		break;
		
		case 28:
		array_push(waveArray, oWastelandFireSpirit)
		break;
		
		case 31:
		array_push(waveArray, oEnemRifterSpider)
		break;
		
		case 33:
		array_push(waveArray, oRifterSpitter)
		break;
		
		case 34:
		array_push(bossArray, oRifterTank, oRifterSpitter, oRifterSlammer)
		break;
		
		case 36:
		array_push(waveArray, oRifterTank)
		break;
		
		case 38:
		array_push(waveArray, oRifterSlammer)
		break;
		
		case 41:
		array_push(waveArray, oEnemBlackHole)
		break;
		
		case 43:
		array_push(waveArray, oPlainsShooter)
		break;
		
		case 44:
		array_push(bossArray, oWastelandDestroyer)
		break;
		
		case 50: 
		array_push(bossArray, oKrost)
		break;
	}
	startingWeight *= 1.04;
	waveWeight = startingWeight;
	waveCooldown = waveTimer;
	if (wave >= waveLimit && isLimited) {
		unpowerDoor(RoomID);
		powerTorzol();
		with (oGhostBarrier) {
			if (RoomID == other.RoomID) {
				revealNearbyRooms(id);
			}
		}
		state = waveState.done;
		active = false;
		itemSpawner = noone;
		with (oWavebasedStarter) {
			other.itemSpawner = instance_nearest(x, y, oItemFlag);
		}
		//var newItem = rollItem(true,,true);
		//spawnItem(newItem, itemSpawner, RoomID);
		oItemManager.luckBonus += 2;
		oPlayerManager.xpMult += 0.1;
		manager.combatFinished = true;
	} else {
		state = waveState.waiting;
	}
	
}
if (waveCooldown > 0 && state == waveState.waiting) {
	waveCooldown--;
}
if (waveCooldown <= 0 && state == waveState.waiting) {
	state = waveState.spawning;
}