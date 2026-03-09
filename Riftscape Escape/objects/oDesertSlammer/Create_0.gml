event_inherited();
chargeCooldown = irandom_range(80, 160);
chargeDelay = 240;
chargeTargetY = 0;
chargeTargetX = 0;
chargeTime = 8;
chargeDir = 0;
charging = false;
enemSpeed = 0.3
attackDelay = 60;


enum ENEM_STATE {
	CHASE, WINDUP, CHARGE, RECOVER
}

state = ENEM_STATE.CHASE;



impactDelay = 36;
iFrames = 0;
bullet_speed = 1.5;
shoot_delay = 160;
enemey_hp = 26;
enrage_point = enemey_hp/2;
enraged = false;
xp = 12.5;
damage = 8;




