width = 0;
builder = noone;
ready = false;
challengeArray = [];
spawned = false;
spawn_timer = spawn_cooldown;
portal_cooldown = 35;
portal_timer = portal_cooldown;
enemies = enem1count + enem2count + enem3count + enem4count + enem5count + enem6count + enem7count + enem8count + enem9count + enem10count;
portal_count = enemies;
enemyPull = 0;
enem = noone;
tempEnemy = noone;
hasBoss = false;
enemySelect = oEnemBasic;
spawn = false;
bossPull = noone;
temp_portal = noone;
workerStartRoom = noone;
workerDoor1 = noone;
workerDoor2 = noone;
workerFlag = noone;
workerSpawners = noone;
workerBossSpawners = noone;
workerX = noone;
workerY = noone;
destroyWalls = false;
checkFor = false;
evilWallList = ds_list_create();
spawnerList = ds_list_create();
inCombat = false;
killLifeHusk = false;
combatFinished = false;
roomType = "null"
enemyPool = enemies;
roomStart = false;
BossList = ds_list_create();
totalBoss = 0;
BossKey = noone;
itemSpawner = noone;
reBuildGrid = false;
teleSpawn = noone;
global.activeRoom = false;
built = false;
fmanager = noone;
doBoss = false;
bossSpawner = noone;
diffPool = 0;
floorID = "null";
enemArray = [];
bossArray = [];
with (oRoomClaimX) {
	if (RoomID == other.RoomID) {
		other.workerX = id;
	}
}
with (oRoomClaimY) {
	if (RoomID == other.RoomID) {
		other.workerY = id;
	}
}
with (oFloorManager) {
	other.fmanager = id;
	other.floorID = floorID;
}
if (fmanager != noone) {
	startBuildRoom(fmanager, id)
	var arrayUnpacker = getEnemPool(floorID)
	enemArray = arrayUnpacker.normArray;
	bossArray = arrayUnpacker.bArray;
}
bossRoom = false;
testRange = noone;
testTop = noone;
testBottom = noone;
testLeft = noone;
testRight = noone;


// checks for x and y markers (needed for evil walls)
