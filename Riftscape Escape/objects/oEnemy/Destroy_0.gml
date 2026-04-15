oPlayerManager.xpTotal += xp
if (path_exists(path)) {
    path_delete(path);
}
if (isBoss) {
	global.bossBarCount--;
	with (oEnemy) {
		if (isBoss && bossBarIndex > other.bossBarIndex) {
			bossBarIndex--;
		}
	}
}
if (!denyHP) {
	var blood = instance_create_layer(x, y, "Items", oRiftBloodSplatter)

	blood.image_xscale = image_xscale;
	blood.image_yscale = image_yscale;
}