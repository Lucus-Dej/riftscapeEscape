// Inherit the parent event
event_inherited();
vesselInit = false;
shoot_cooldown = irandom_range(10, 25);
enemSpeed = 0.1;
baseSpeed = enemSpeed;
bullet_speed = 3.5;
shoot_delay = 140;
recoil_cooldown = 16;
fire_duration = 6;
fire_timer = fire_duration;
recoil_timer = 0;
 enemyHP = 30;
heldHP =  enemyHP;
invincible = false;
enrage_point =  enemyHP/2;
enraged = false;
damage = 4.5;
path_cooldown = 30;

hostSearchCooldown = 260;
hostSearchTimer = 60;
enemySearchList = ds_list_create();

vessel = noone;

// vessel stats
VesselEnemSpeed = 0.5;
VesselDamage = 8;
VesselBaseSpeed = VesselEnemSpeed;
			
VesselPath_cooldown = 15;
VesselShoot_cooldown = 120;
VesselShootTimer = VesselShoot_cooldown;
VesselPath_timer = 15;
VesselBulletSpeed = 4;

searchPlayer();
