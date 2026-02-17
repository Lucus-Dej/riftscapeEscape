/*
shoot_cooldown = irandom_range(10, 110);
shoot_delay = 120;
enemey_hp = 3;
path = path_add();
path_cooldown = 15;
path_timer = path_cooldown;
enemSpeed = 0.1;
base_enemSpeed = enemSpeed;
xp = 4;
damage = 6;
hasDamaged = false;
lastDamagedBy = noone;
dragTimer = 0;
dragPower = 0;
dragDir = 0;

enemey_hp = 1;
bite_cooldown = 75;
on_cooldown = false;
bite_timer = bite_cooldown;
path = path_add();
path_cooldown = 15;
path_timer = path_cooldown;
enemSpeed = 2.25;
base_enemSpeed = enemSpeed;
xp = 1.35;
damage = 8;
hasDamaged = false;
lastDamagedBy = noone;
dragTimer = 0;
dragPower = 0;
dragDir = 0;

chargeCooldown = irandom_range(80, 240);
chargeDelay = 240;
chargeTargetY = 0;
chargeTargetX = 0;
chargeTime = 8;
chargeDir = 0;
charging = false;
enemSpeed = 0.3
attackDelay = 60;
lastDamagedBy = noone;
dragTimer = 0;
dragPower = 0;
dragDir = 0;

enum ENEM_STATE {
	CHASE, WINDUP, CHARGE, RECOVER
}

state = ENEM_STATE.CHASE;



impactDelay = 36;
iFrames = 0;
bullet_speed = 1.5;
shoot_delay = 160;
enemey_hp = 16;
path = path_add();
path_cooldown = 15;
path_timer = path_cooldown;
enrage_point = enemey_hp/2;
enraged = false;
xp = 12.5;
damage = 8;
hasDamaged = false;

enrage_point = enemey_hp/2;
enraged = false;