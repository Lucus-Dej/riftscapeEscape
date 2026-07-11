if (!veribroseMark) {
	itemAdd(object_index);
}
if (flag != noone) {
	flag.Manager.combatFinished = true;
}
 if (instance_exists(oItemFlag)) {
	 with (oItemFlag) {
		 if (veribroseItem) {
			 veribroseCleanse = true;
		 }
	 }
 }