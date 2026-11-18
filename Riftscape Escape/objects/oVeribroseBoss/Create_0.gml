// Inherit the parent event
event_inherited();
RoomID = 1;
enemyHP = 40;
healthTotal =  enemyHP;
accel = 0;
spawnPool = 350;
phasePoint1 =  enemyHP*(4/5);  // up to this point, it is damage dealt via lasers breaking immunity
phasePoint2 =  enemyHP*(3/5);  // another laser phase, this time with the maze
phasePoint3 =  enemyHP*(2/5);  // all hell breaks loose
phase = 0;
shoot_cooldown = 2;
shoot_delay = 320;
//maze attacks

enum veriMode {
	inMaze,
	unleashed,
	desperate,
}
laserArray = [];
with (oVeriLaserNode) {
	if (boss) {
		array_push(other.laserArray, id);
		//setPower(false)
	}
}
bossMode = veriMode.inMaze;
maxMazeMoves = 3;
maxUnleashedMoves = 3;
maxTotalMoves = 0;
currentMaxMoves = 0;
damage = 25;
attack = 0;
enemSpeed = 0.2//.55;
baseSpeed = enemSpeed;
bulletSpeed = 1;

mazeLaserAlpha = -0.2;
mazeLaserInc = 0.001;
laserDir = 0;
mazeLaser = noone;
mazeLaserExistFrames = 48;
mazeLaserCurrentFrames = 0;
mazeLaserNum = 0;
mazeLaserTotal = 2;

mazeBulletExistTime = 240;
mazeBulletNum = 0;
mazeBulletTot = 2;

mazeSlowField = noone;
mazeSlowExistTime = 120;

unleashedMinionSpawnRate = 800;
unleashedMinionArray = [oEnemLibraryPaperGunner, oEnemVerirboseCultist]
mazeMinionSpawnRate = 300;
mazeMinionArray = [oEnemLibraryBookGhost, oEnemLibraryExplosivneBook, oEnemLibraryFatedSoul];
desperateMinionSpawnRate = 240;
desperateMinionArray = [oEnemLibraryBookGhost, oEnemLibraryExplosivneBook, oEnemLibraryFatedSoul, oEnemLibraryPaperGunner, oEnemVerirboseCultist];


unleashedBulletStormCount = 12;
unleashedBulletStormNum = 0;
unleashedBulletStormHomingChance = 20;
unleashedBulletStormBulletSpeed = 4;

unleashedLaserSpiralArray = [];
unleashedLaserSpiralDuration = 360;
unleashedLaserSpiralTick = 1;
unleashedLaserSpiralTime = 0;

unleashedBulletSpiralCount = 16;
unleashedBulletSpiralNum = 0;
unleashedBulletSpiralWaitTime = 12;
unleashedBulletSpiralWaitNum = 0;
unleashedBulletSpiralDelay = 30;
unleashedBulletSpiralAng = irandom(359);
unleashedBulletSpiralInc = 0;

resetLaserAng = function () {
	for (var i = 0; i < array_length(laserArray); i++) {
		var laser = laserArray[i];
		var l = irandom_range(0, 23)*15;
		laser.laserAng = l;
	}
}
resetAttack = function() {
	if (instance_exists(mazeLaser)) {
		instance_destroy(mazeLaser);
		mazeLaserNum = 0;
		mazeLaser = noone;
	}
	//if (instance_exists(mazeSlowField)) {
	//	instance_destroy(mazeSlowField);
	//	mazeSlowField = noone;
	//}
	shoot_cooldown = shoot_delay;
	attack = 0;
}
if (global.difficulty >= 4) {
	damage = 30;
	trueVirst = true;
}
