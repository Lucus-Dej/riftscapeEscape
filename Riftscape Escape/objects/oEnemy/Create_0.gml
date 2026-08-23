if (tempEnem) {
	egg.diff = spawnWeight;
	instance_destroy();
}
path = -1;
jabbed = false;
canPathfind = true;
damagedByArray = [];
links = [];
maxLinks = global.playerTime;
checkCircleFlag = false;
if (instance_exists(oCricleOfFate)) {
	with (oCricleOfFate) {
		if !(playerLeftCircle) {
			other.checkCircleFlag = true;
		}
	}
}
RoomID = 0;
damage = 0;


initalSpeed = 0;
speedBonus = 0;
tempSpeedMult = 1;
tempSlowMult = 1;

baseSpeed = 0;
enemSpeed = 0;


perfectParryTimer = 0;
Manager = noone;
invincible = false;
flying = false;
bossBarIndex  = 0;
isLightExcluded = false;
path_cooldown = 15;
path_timer = path_cooldown;
hasDamaged = false;
lastDamagedBy = noone;
dragTimer = 0;
dragPower = 0;
dragDir = 0;
targetResetTime = 60;
flash = 0;
canSeePlayer = false;
brainDead = false;
bossed = false;
contactIframe = 0;
contactIframeCount = 120;
contactDamage = 17.5;
primeContact = false;
startCount = false;
isBoss = false;
bossModApplied = false;
sub = false;
genHealth = 0;
// boss stats
hpMult = 1;
speedMult = 1;
dmgMult = 1;
cooldownMult = 1;
 enemyHP = 1;
damage = 1;
shoot_delay = 1;
pushTimer = 60;
denyHP = false;
event_inherited();
maxHP = 1;
maxHPSet = false;
respawnTimer = 30;
effectHorsePest = false;
bossRuneChecked = false;
slowPenaltyPercent = 0;
slowMult = 1;
slowArray = [];
slowTimerArray = [];
slowMaxTimerArray = [];
slowTargetArray = [];
slowPenaltyWashoff = 0;
healthTotal =  0;