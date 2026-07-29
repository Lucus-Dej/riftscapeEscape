if (ds_exists(targetList, ds_type_map)) {
    ds_map_destroy(targetList);
    targetList = -1;
}