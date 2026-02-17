path = -1;

path_cooldown = 15;
path_timer = path_cooldown;
hasDamaged = false;
lastDamagedBy = noone;
dragTimer = 0;
dragPower = 0;
dragDir = 0;
targetResetTime = 60;
flash = 0;
canSeePlayer = false;
followLight = instance_create_layer(x, y, "Instances", oEnemFollowLight);
followLight.owner = id;