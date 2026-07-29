if (!veribroseMark && grabed) {
	itemAdd(object_index);
}
if (flag != noone && instance_exists(flag.Manager)) {
	flag.Manager.combatFinished = true;
}
 if (room == veribroseItemRoom) {
	 with (oItems) {
		 if (veribroseMark) {
			 instance_destroy();
		 }
	 }
 }