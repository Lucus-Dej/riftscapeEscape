event_inherited()
minionSpeed = 65;
follow = oTruePlayer;
bulletCoolDown = global.bullet_delay;
bulletDelay = bulletCoolDown;
xTo = x;
yto = y
target = noone;
fire = false;
fateBullet = -1;
if (instance_exists(oMinionEssence)) {
	with oMinionEssence {
		instance_destroy();
	}
}
oPlayerManager.essenceMinionCount = 0;