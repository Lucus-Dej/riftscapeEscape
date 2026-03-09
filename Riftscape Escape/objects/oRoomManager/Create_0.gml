width = 0;
builder = noone;
ready = false;
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
enemySelect = oBadGuy;
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
enemyPool = enemies;
roomStart = false;
BossList = ds_list_create();
totalBoss = 0;
BossKey = noone;
itemSpawner = noone;
reBuildGrid = false;
teleSpawn = noone;
global.activeRoom = false;


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
if (builder == noone) {
	builder = instance_create_layer(x, y, "Instances", oRoomBuilder);
	show_debug_message("I HAVE MADE THE BUILDER")
	builder.owner = id;
	builder.RoomID = RoomID;
}



// checks for x and y markers (needed for evil walls)
