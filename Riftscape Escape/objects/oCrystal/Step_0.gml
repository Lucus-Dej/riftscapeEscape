if (oItemManager.hasBloodCharm) {
	var bloodCheck = irandom_range(1, 12) + global.playerTime * 0.6;
	if (bloodCheck >= 12) {
		var spill = instance_create_layer(x+random_range(-128, 128), y+random_range(-128, 128), "Items", oBloodSpill)
		spill.dmg = damage*0.05;
		var scale = random_range(0.5, 2);
		scale = (image_xscale*0.5)*scale;
		spill.image_xscale = scale;
		spill.image_yscale = scale;
	}
}
if (oItemManager.hasFireCharm) {
	 var fireCharmCheck = irandom_range(0, 8) + global.playerTime*0.75;
	 if (fireCharmCheck >= 8) {
		 var ang = irandom(359);
		 var ranSpeed = global.bullet_speed * (random_range(0.5, 1.5));
		 fireFireFireCharm(x,y, ang, ranSpeed);
	 }
}
if (oPlayerManager.hasCrystalThought) {
	target = instance_nearest(x, y, oEnemy);
	pathTimer--;
	if (target != noone && instance_exists(target) && pathTimer <= 0) {
		pathfind(global.Grid, target, chaseSpeed, id);
		pathTimer = 10;
	}
}