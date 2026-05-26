if (state == waveState.idle) {
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
		spawnChecked = true;
		
	}
}
if (state == waveState.generatingWave) {
	for (var f = 0; f < array_length(waveArray); f++) {
		
	}
}
if (state == waveState.spawning) {
	enemiesLeft = instance_number(oEnemy);
	enemString = "Enemies Left: "+string(enemiesLeft);
	inCombat = true;
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
			with (spawner) {
				var enem = instance_create_layer(x, y, "Instances", pull);
				enem.RoomID = RoomID;
				if (other.bossRound) {
					enem.isBoss = true;
					bossMod(enem.id);
					enem.spawnWeight *= 2;
					enem.xp *= 1.3;
				} else {
					enem.xp /= 3.5;
				}
				other.waveWeight -= enem.spawnWeight
			}
			spawnCooldown = spawnDelay
		}
	} else if (!instance_exists(oEnemy)) {
		if (itemRound) {
			with (itemSpawner) {
				event_user(0);
			}
			roundsTillItem = 8;
			itemRound = false;
		}
		if (bossRound) {
			startingWeight += bossBonus*4;
			bossBonus++;
			roundsTillBoss = 4;
			bossRound = false;
		}
		state = waveState.inBetween;
	}
}
if (state == waveState.inBetween) {
	inCombat = false;
	if (global.chargeItem != noone && global.currentCharges < global.itemCharges) {
		global.currentCharges += 1;
	}
	wave += 1;
	waveTxt = "Wave: "+string(wave);
	roundsTillBoss--;
	roundsTillItem--;
	if (roundsTillBoss == 0) {
		bossRound = true;
	}
	if (roundsTillItem == 0) {
		itemRound = true;
	}
	switch (wave) {
		case 1:
		array_push(waveArray, oEnemBasic)
		startingWeight += 2;
		break;
		
		case 2:
		array_push(waveArray, oEnemBig)
		break;
		
		case 4:
		array_push(waveArray, oEnemTurret)
		break;
		
		
		case 6:
		array_push(bossArray, oBoss3, oMiniBoss3)
		break;
		
		case 13:
		array_push(waveArray, oMiniBoss, oMiniBoss2,)
		break;
		
		case 11:
		array_push(waveArray, oEnemDesertBiter)
		break;
		
		case 14:
		array_push(waveArray, oEnemSandSniper)
		break;
		
		case 16:
		array_push(waveArray, oDesertSlammer, oMiniBoss3)
		break;
		
		case 18:
		array_push(bossArray, oMummy)
		break;
		
		case 21:
		array_push(waveArray, oWastelandBurner)
		break;
		
		case 26:
		array_push(bossArray, oWastelandFireRunner)
		break;
		
		case 28:
		array_push(waveArray, oBoss3)
		break;
		
		case 31:
		array_push(waveArray, oEnemRifterSpider)
		break;
		
		case 33:
		array_push(waveArray, oRifterSpitter)
		break;
		
		case 34:
		array_push(bossArray, oRifterTank)
		break;
		
		case 36:
		array_push(waveArray, oRifterTank)
		break;
		
		case 37:
		array_push(waveArray, oRifterSlammer)
		break;
		
		case 38:
		array_push(waveArray, oRifterSniper)
		break;
		
		case 40:
		array_push(bossArray, oRifterSniper, oRifterSlammer, oRifterSpitter)
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
	startingWeight *= 1.06;
	waveWeight = startingWeight;
	waveCooldown = waveTimer;
	state = waveState.waiting;
}
if (waveCooldown > 0 && state == waveState.waiting) {
	waveCooldown--;
}
if (waveCooldown <= 0 && state == waveState.waiting) {
	state = waveState.spawning;
}