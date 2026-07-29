minionSpeed = 15;
follow = oTruePlayer;
cooldown = 120;
missCount = 0;
delay = 20;
primed = true;
orbitAngle = 0;
orbitRadius = 80;
orbitTargetRadius = 80;
baseCooldown = cooldown;
famPower = 0;
baseChaseSpeed = 14.5;
chaseSpeed = baseChaseSpeed;
accelSpeed = 0;
chaseAudio = aPortalOpen;
ambChaseMusic = noone;
baseRot = 45;
rot = baseRot;
currentDir = direction;
xTo = x;
yto = y
target = noone;
fire = false;
damageArray = [];
damageTimerArray = [];
dmgRefreshTime = cooldown;
passivePowerTimer = 12;
attackDuration = 60;
attackTimer = 0;
targetList = ds_list_create();
enum SICKLEMODE {
	idle,
	recharging,
	attacking,
	recovering
}
damage = 0.1
mode = SICKLEMODE.recharging;
rotation = -1;