var hit = other;

if (!instance_exists(hit)) exit;

lastHit = hit;
if (purpose == 1) {
	 if (!ds_exists(boomDamageList, ds_type_map)) {
        boomDamageList = ds_map_create();
    }
	if (!ds_map_exists(boomDamageList, hit.id)) {
        ds_map_add(boomDamageList, hit.id, true);
            hit.obHP -= global.playerDamage*1.5;
        if (hit.obHP <= 0) {
            instance_destroy(hit);
        }
	}
}