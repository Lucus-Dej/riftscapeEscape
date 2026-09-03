wave = 0;
active = false;
waveTxt = "Wave: 0";
enemiesLeft = 0;
enemString = "Enemies Left: "+string(enemiesLeft);
startingWeight = 3;
roundsTillBoss = 5;
bossRound = false;
itemRound = false;
roundsTillItem = 10;
roundsTillRune = 15;
runeRound = false;
bossBonus = 1;
limitedWaveDoorSet = false;
waveArray = [ oEnemSpider]
bossArray = [oBoss, oBoss2, oEnemMotherCaveSpider, oMiniBoss2, oMiniBoss, oEnemBigBat, oCavesStoneGolem];
allEnemPool = [oWastelandSpitter, oEnemMiniMummy, oEnemBig, oEnemBlackHole, oEnemDesertBiter, oEnemSandSniper,
	oEnemSpider, oEnemTurret, oPlainsShooter, oWastelandBurner, oWastelandFireRunner, 
	oBoss, oBoss2, oBoss3, oDesertSlammer, oMiniBoss, oMiniBoss2, oMiniBoss3, oRifterTank, 
	oMummy, oWastelandDestroyer];
	
enum waveState {
	preparing, idle, generatingWave, spawning, inBetween, waiting, done
}
gendFlyGrid = false;
state = waveState.idle;
spawnDelay = 20;
if (global.difficulty == 1) {
	spawnDelay = 40;
} else if (global.difficulty >= 3) {
	spawnDelay = 5;
}
waveWeight = startingWeight;
spawnCooldown = spawnDelay;
spawnerArray = [];
spawnChecked = false;
roomStarter = noone;
waveTimer = 60;
waveCooldown = waveTimer;
itemSpawner = noone;
inCombat = false;

manager = noone;
restrictedArrays = false;
isLimited = false;
waveLimit = 999999999999999999;
roomManager = noone;