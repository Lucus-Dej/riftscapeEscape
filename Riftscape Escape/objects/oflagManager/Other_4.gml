with (oFlagUpdate) {
    if (flagID == other.flagID) {
        ds_list_add(other.flagList, id);
		flagManager = other.id;
    }
}