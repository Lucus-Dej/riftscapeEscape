// Inherit the parent event
event_inherited();
vesselInit = false;
shoot_cooldown = irandom_range(10, 25);
enemSpeed = 0.1;
base_speed = enemSpeed;
bullet_speed = 3.5;
shoot_delay = 120;
recoil_cooldown = 12;
fire_duration = 6;
fire_timer = fire_duration;
recoil_timer = 0;
enemey_hp = 26;
heldHP = enemey_hp;
invincible = false;
enrage_point = enemey_hp/2;
enraged = false;
xp = 20;
spawnWeight = 10;
damage = 3;
path_cooldown = 30;

hostSearchCooldown = 300;
hostSearchTimer = 60;
enemySearchList = ds_list_create();

vessel = noone;

// vessel stats
VesselEnemSpeed = 0.5;
VesselDamage = 10;
VesselBaseSpeed = VesselEnemSpeed;
			
VesselPath_cooldown = 15;
VesselShoot_cooldown = 120;
VesselShootTimer = VesselShoot_cooldown;
VesselPath_timer = 15;
VesselBulletSpeed = 2;

searchPlayer();
