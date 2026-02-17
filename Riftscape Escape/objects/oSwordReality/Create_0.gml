if (instance_exists(oSwordFate)) {
	instance_destroy(oSwordFate)
}
audio_play_sound_at(aPortalOpen, x, y, 0, 0, 0, 0, 0, 2);
//image_angle =  point_direction(oTruePlayer.x, oTruePlayer.y, mouse_x, mouse_y);
image_xscale = sign(mouse_x - oTruePlayer.x);

if (oPlayerManager.hasSwordLife) {
	swordLifeTargets = ds_list_create();
	picked = ds_list_create();
	
	collision_circle_list(x, y, 640, oEnemy, false, false, swordLifeTargets, true);
	if (ds_list_size(swordLifeTargets) == 0) {
		ds_list_destroy(swordLifeTargets)
		ds_list_destroy(picked)
		exit;
	}
	for( i= 0; i < global.playerLife+global.playerEssence; i++) {
		if (i < ds_list_size(swordLifeTargets)) {
		ds_list_add(picked, swordLifeTargets[| i]);	
	} else {
		randomPull = irandom(ds_list_size(swordLifeTargets) - 1);
		ds_list_add(picked, swordLifeTargets[| randomPull]);
		}
	}
for (i = 0; i < ds_list_size(picked); i++) {
	spawn = picked[| i]
	if (!instance_exists(spawn)) {
		continue
	}
	dir = point_direction(x, y, spawn.x, spawn.y);
	swordProj = instance_create_layer(x, y, "Instances", oSwordLife);
	swordProj.speed = 3+global.playerLife+global.playerEssence;
	swordProj.direction = dir;
	swordProj.image_angle = swordProj.direction-90;
	swordProj.target = spawn;
}
}
