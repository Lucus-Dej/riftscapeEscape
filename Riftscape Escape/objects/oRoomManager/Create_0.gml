width = 0;
builder = noone;
ready = false;
challengeArray = [];
miniMapWalls = [];
miniMapDoors = [];
spawned = false;
spawn_timer = spawn_cooldown;
portal_cooldown = 20;
if (global.difficulty == 1) {
	portal_cooldown = 40;
} else if (global.difficulty >= 3) {
	portal_cooldown = 5;
}
portal_timer = portal_cooldown;
enum roomManagerType {
	normal,
	ritual,
	arena
}
type = roomManagerType.normal;
waveManager = noone;
wavebasedSpawned = false;

wavebasedAddChallenge = 3;
wavebasedAddTurret = 1;
addedChallenge = false;
isFloorGen = false;
enum spawnState {
	idle,
	buildingArray,
	spawning,
	spawnFinished,
	outOfCombat
}
state = spawnState.idle;
enemies = enem1count + enem2count + enem3count + enem4count + enem5count + enem6count + enem7count + enem8count + enem9count + enem10count;
portal_count = enemies;
preEnemArray = [enem1, enem2, enem3, enem4, enem5, enem6, enem7, enem8, enem9, enem10];
preEnemCount = [enem1count, enem2count, enem3count, enem4count, enem5count, enem6count, enem7count, enem8count, enem9count, enem10count];
buffer = portal_cooldown + spawn_cooldown;
enemyPull = 0;
enem = noone;
tempEnemy = noone;
hasBoss = false;
enemySelect = oEnemMiniMummy;
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
isBossRoom = false;
destroyWalls = false;
checkFor = false;
evilWallList = ds_list_create();
spawnerList = ds_list_create();
doorList = [];
inCombat = false;
isChallenge = false;
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
	show_debug_message("SEARCHING")
	other.fmanager = id;
	other.floorID = floorID;
}
with (oEnemyTurrets) {
	if (RoomID == other.RoomID) {
		other.manager = id;
	}
}
if (fmanager != noone) {
	startBuildRoom(fmanager, id)
	var arrayUnpacker = getEnemPool(floorID)
	enemArray = arrayUnpacker.normArray;
	bossArray = arrayUnpacker.bArray;
	if (instance_exists(oRitualRoomManager)) {
		with (oRitualRoomManager) {
			if (RoomID == other.RoomID) {
				manager = id;
			}
		}
	}
} 
revealFlag = false;
spawner = noone;
floorManager = noone;
specialRoom = false;
floorCleared = false;
bossRoom = false;
testRange = noone;
testTop = noone;
testBottom = noone;
testLeft = noone;
testRight = noone;
mask = noone;

discovered = false;
hinted = false;
// checks for x and y markers (needed for evil walls)
