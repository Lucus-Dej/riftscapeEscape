event_inherited();

 enemyHP = 215;
damage = 20;
enemSpeed = 0.85;
baseSpeed = enemSpeed;
directionCooldown = 220;
directionTimer = directionCooldown;
dirMod = 0;
phasePoint1 =  enemyHP*(3/5);
phase1Applied = false;
phasePoint2 = enemyHP*(2/5);
phase2Applied = false;
phasePoint3 =  enemyHP*(1/5);
phase3Applied = false;
shoot_cooldown = irandom_range(25, 130);
shoot_delay = 380;
bullet_speed = 10.5;
tpArray = [];
with (oKrostTp) {
	array_push(other.tpArray, id);
}

searchPlayer();
image_xscale = 1.5;
image_yscale = 1.5;