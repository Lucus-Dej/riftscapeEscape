wave = 0;
startingWeight = 3;
roundsTillBoss = 5;
bossRound = false;
waveArray = [ oEnemSpider]
bossArray = [oBoss, oBoss2, oMiniBoss2, oMiniBoss];
allEnemPool = [oCaveSpitter, oEnemBasic, oEnemBig, oEnemBlackHole, oEnemDesertBiter, oEnemSandSniper,
	oEnemSpider, oEnemTurret, oPlainsShooter, oWastelandBurner, oWastelandFireRunner, 
	oBoss, oBoss2, oBoss3, oDesertSlammer, oMiniBoss, oMiniBoss2, oMiniBoss3, oRifterTank, 
	oMummy, oWastelandDestroyer];
	
enum waveState {
	preparing, idle, generatingWave, spawning, inBetween, waiting
}
state = waveState.idle;
spawnDelay = 30;
waveWeight = startingWeight;
spawnCooldown = spawnDelay;
spawnerArray = [];
spawnChecked = false;
roomStarter = noone;
waveTimer = 300;
waveCooldown = waveTimer;
itemSpawner = noone;
inCombat = false;