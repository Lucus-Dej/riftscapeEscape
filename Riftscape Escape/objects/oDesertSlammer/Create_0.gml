event_inherited();
chargeCooldown = irandom_range(30, 60);
chargeDelay = 260;
chargeTargetY = 0;
chargeTargetX = 0;
chargeTime = 12;
chargeDir = 0;
charging = false;
enemSpeed = 0.3
baseSpeed = enemSpeed;
attackDelay = 60;


enum ENEM_STATE {
	CHASE, WINDUP, CHARGE, RECOVER
}

state = ENEM_STATE.CHASE;



impactDelay = 36;
iFrames = 0;
bullet_speed = 1.5;
shoot_delay = 160;
enemyHP = 15;
phasePoint1 =  enemyHP/2;
enraged = false;
damage = 14;
chargeBonus = 0;
contactDamage = damage;



