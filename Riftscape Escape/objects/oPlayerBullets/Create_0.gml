damage = global.playerDamage;
inCircle = false;
canParry = true;
parried = false;
canLifesteal = false;
boomerangTime = 12;
speed = global.bullet_speed;
richCount = 0;
resetTimer = 120;
startReset = false;
hasReversed = false;
damage = global.playerDamage;
direction = point_direction(
    x, y,
    oTruePlayer.x + oTruePlayer._xinput,
    oTruePlayer.y + oTruePlayer._yinput
);
damagedList = ds_map_create();
ignoreEnemy = noone;
if (oPlayerManager.canRich) {
	richCount = 1;
} else {
	richCount = 0;
}
decayRate = (global.playerReality + 4)/24
increaseRate = (global.playerReality + 2)/32
pierceDebuffed = false;