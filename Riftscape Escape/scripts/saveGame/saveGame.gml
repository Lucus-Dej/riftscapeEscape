function saveGame(){
	var saveArray = [];
	
	array_push(saveArray, global.musicAudio);
	array_push(saveArray, global.sfxAudio);
	
	var file = file_text_open_write("rscapeSave.txt");
	
	var text = json_stringify(saveArray);
	file_text_write_string(file, text);
	show_debug_message(text);
	file_text_close(file);
}

function loadGame(){
	if (file_exists("rscapeSave.txt")) {
		var file = file_text_open_read("rscapeSave.txt");
		
		var json = file_text_read_string(file);
		file_text_close(file);
		
		show_debug_message(json);
		
		var loadArray = json_parse(json);
		global.musicAudio = loadArray[0];
		global.sfxAudio = loadArray[1];
	} else {
		global.musicAudio = 0.2;
		global.sfxAudio = 0.5;
	}
}