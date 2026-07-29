global.gameSeconds ++;

if (global.gameSeconds >= 60) {
	global.gameSeconds = 0;
	global.gameMinutes++;
	
	if (global.gameMinutes >= 60) {
		global.gameMinutes = 0;
		global.gameHours++;
	}
}
global.time = string_format(global.gameHours, 2, 0) + ":" + string_format(global.gameMinutes, 2, 0) + ":" + string_format(global.gameSeconds, 2, 0);
alarm[0] = 60;
