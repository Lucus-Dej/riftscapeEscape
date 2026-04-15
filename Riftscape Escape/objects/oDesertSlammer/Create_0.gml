event_inherited();
chargeCooldown = irandom_range(80, 160);
chargeDelay = 260;
chargeTargetY = 0;
chargeTargetX = 0;
chargeTime = 12;
chargeDir = 0;
charging = false;
enemSpeed = 0.3
base_speed = enemSpeed;
attackDelay = 60;


enum ENEM_STATE {
	CHASE, WINDUP, CHARGE, RECOVER
}

state = ENEM_STATE.CHASE;



impactDelay = 36;
iFrames = 0;
bullet_speed = 1.5;
shoot_delay = 160;
enemey_hp = 18;
phasePoint1 = enemey_hp/2;
enraged = false;
xp = 13;
damage = 12.5;
spawnWeight = 7.5;



