damage = global.playerDamage;
inCircle = false;
canParry = true;
parried = false;
canLifesteal = false;
speed = global.bullet_speed;
richCount = 0;
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