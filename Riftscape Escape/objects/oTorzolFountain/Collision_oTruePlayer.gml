if (active && other.torzPower > 0) {
	other.torzPower -= 0.1;
	other.flash = 2;
	healPlayer(0.01, true)
}