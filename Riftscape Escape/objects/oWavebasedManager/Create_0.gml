wave = 0;
active = false;
waveTxt = "Wave: 0";
enemiesLeft = 0;
enemString = "Enemies Left: "+string(enemiesLeft);
startingWeight = 3;
roundsTillBoss = 4;
bossRound = false;
itemRound = false;
roundsTillItem = 8;
bossBonus = 1;
waveArray = [ oEnemSpider]
bossArray = [oBoss, oBoss2, oMiniBoss2, oMiniBoss, oCaveSpitter, oEnemBig];
allEnemPool = [oCaveSpitter, oEnemBasic, oEnemBig, oEnemBlackHole, oEnemDesertBiter, oEnemSandSniper,
	oEnemSpider, oEnemTurret, oPlainsShooter, oWastelandBurner, oWastelandFireRunner, 
	oBoss, oBoss2, oBoss3, oDesertSlammer, oMiniBoss, oMiniBoss2, oMiniBoss3, oRifterTank, 
	oMummy, oWastelandDestroyer];
	
enum waveState {
	preparing, idle, generatingWave, spawning, inBetween, waiting, done
}
state = waveState.idle;
spawnDelay = 30;
waveWeight = startingWeight;
spawnCooldown = spawnDelay;
spawnerArray = [];
spawnChecked = false;
roomStarter = noone;
waveTimer = 60;
waveCooldown = waveTimer;
itemSpawner = noone;
inCombat = false;

restrictedArrays = false;
isLimited = false;
waveLimit = 999999999999999999;
