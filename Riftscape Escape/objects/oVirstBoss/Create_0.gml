event_inherited();
shoot_cooldown = irandom_range(10, 110);
turretApplied = false;
shoot_delay = global.bullet_delay*3;
baseShootDelay = shoot_delay;
 enemyHP = 350;
enemSpeed = 1;
baseSpeed = enemSpeed;
xp = 85;
damage = 20;
bullet_speed = 5.5;
searchPlayer();
spawnWeight = 2;
image_blend = c_yellow;
orbitCount = 0;
brainReduction = 0;
attackStr = 0;
defenseStr = 0;
if (oItemManager.hasLilFurnace) {
	var f = instance_create_layer(x, y, "Instances", oLilFurnace);
	f.evil = true;
	f.follow = id;
}
if (oItemManager.hasTetheredSoul) {
	var r = instance_create_layer(x, y, "Instances", oTetheredSoulEvil)
	r.evil = true;
	r.follow = id;
}
if (oItemManager.hasImageOfYou) {
	var r = instance_create_layer(x, y, "Instances", oNotYou)
	r.evil = true;
	r.follow = id;
}
alextraLocked = false;
savedByVirstEssence = false;
sifterLinked = false;