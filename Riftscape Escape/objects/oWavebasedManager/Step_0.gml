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
					enem.xp *= 2.5;
					bossMod(enem.id);
					enem.spawnWeight *= 2;
				}
				other.waveWeight -= enem.spawnWeight
			}
			spawnCooldown = spawnDelay
		}
	} else if (!instance_exists(oEnemy)) {
		if (bossRound) {
			startingWeight += bossBonus*6.5;
			bossBonus++;
			itemSpawner.spawnItem = true;
			with (itemSpawner) {
				event_user(0);
			}
			roundsTillBoss = 5;
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
	roundsTillBoss--;
	if (roundsTillBoss == 0) {
		bossRound = true;
	}
	switch (wave) {
		case 1:
		array_push(waveArray, oEnemBasic)
		startingWeight += 2;
		break;
		
		case 2:
		array_push(waveArray, oEnemBig)
		break;
		
		case 3:
		array_push(waveArray, oEnemTurret)
		break;
		
		
		case 6:
		array_push(bossArray, oBoss3, oMiniBoss3)
		break;
		
		case 7:
		array_push(waveArray, oMiniBoss, oMiniBoss2,)
		break;
		
		case 8:
		array_push(waveArray, oEnemDesertBiter)
		break;
		
		case 9:
		array_push(waveArray, oEnemSandSniper,  oDesertSlammer,)
		break;
		
		case 11:
		array_push(bossArray, oMummy)
		break;
		
		case 12:
		array_push(waveArray, oWastelandBurner, oMiniBoss3)
		break;
		
		case 14:
		array_push(bossArray, oWastelandFireRunner)
		break;
		
		case 16:
		array_push(waveArray, oBoss3)
		break;
		
		case 17:
		array_push(waveArray, oPlainsShooter)
		break;
		
		case 19:
		array_push(bossArray, oRifterTank)
		break;
		
		case 21:
		array_push(waveArray, oEnemBlackHole)
		break;
		
		case 24:
		array_push(bossArray, oWastelandDestroyer)
		break;
		
		case 25:
		array_push(waveArray, oRifterTank)
		break;
		
		case 50: 
		array_push(bossArray, oKrost)
		break;
	}
	startingWeight *= 1.065;
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