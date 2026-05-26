
with (oUpgradeTokenReal) {
	if (id != other.id) {
		upgrade = 0;
		selected = false;
	}
	global.currentUpgradeID = 0;
}
if (valid) {
	switch (selected) {
		case (true):
		show_debug_message("I HAVE BEEN UNSELECTED")
		selected = false;
		
		break;
		
		case (false):
		selected = !selected;	
		show_debug_message("I HAVE BEEN SELECTED")
		upgrade = upgradeID;
		global.currentUpgradeID = upgradeID;
		break;
	}
}
if (valid && !selected) {
	
} else {
	
} 
