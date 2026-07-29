event_inherited()
targetList = ds_list_create()
minionSpeed = 65;
follow = oTruePlayer;
bulletCoolDown = global.bullet_delay;
minionCrownSpeedBonus = 0;
minionCrownDmgBonus = 0;
minionChaseSpeed = global.playerReality*0.4 + 3.5;
minionRealitySpeedBonus = 0;
bulletDelay = bulletCoolDown;
accelSpeed = 0;
rot = 1 + global.playerReality;
xTo = x;
yto = y
target = noone;
fire = false;
fateBullet = -1;
damageArray = [];
damageTimerArray = [];
dmgRefreshTime = 40;
primed = false;
baseDmg = 0.08;
damage = baseDmg;
mode = fateMinionMode.idle;
oPlayerManager.essenceMinionCount++