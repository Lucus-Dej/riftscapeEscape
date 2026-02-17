if (ds_exists(boomDamageList, ds_type_map)) {
    ds_map_destroy(boomDamageList);
    boomDamageList = -1;
}
