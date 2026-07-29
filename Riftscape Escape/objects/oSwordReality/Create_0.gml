image_xscale = 0.8;
image_yscale = 0.8;
flash = 0;
flashUp = true;
flashRate = 0.1;
beginReturn = false;
damageArray = [];
damageTimerArray = [];
dmgRefreshTime = 40;
attackDuration = 240 + global.playerEssence*12;
attackTimer = 0;
validForTp = false;
buffer = 0;
targetList = ds_list_create();
damage = global.playerDamage + oPlayerManager.swordDmgBonus + sqrt(global.playerEssence) * 0.45;
chaseSpeed = 5 + global.playerEssence*0.3 + global.playerReality*0.6;
baseChaseSpeed = chaseSpeed;
baseRot = 6 + global.playerEssence*0.5;
rot = baseRot;
accelSpeed = 0;
enum SWORDMODE {
	attacking,
	controlling,
	returning
}
mode = SWORDMODE.attacking;
xTo = oMouseTracker.x;
yTo = oMouseTracker.y;
follow = noone;
image_speed = 2;