function saveGame(){
	var saveData = {
		musicAudio: global.musicAudio,
		sfxAudio: global.sfxAudio,
		metaProgression: global.meta,
		difficulty: global.difficulty
	};
	
	var file = file_text_open_write("rscapeSave.txt");
	var text = json_stringify(saveData);
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
		unlocokChallenges()
		var saveData = json_parse(json);
		var names = ["musicAudio", "sfxAudio", "metaProgression", "difficulty"];
		for (var i = 0; i < array_length(names); i++) {
			var name = names[i];
			if (!variable_struct_exists(saveData, name)) {
				continue;
			}
			switch (name) {
				case "musicAudio":
				global.musicAudio = struct_get(saveData, name)
				break;
				
				case "sfxAudio":
				global.sfxAudio = struct_get(saveData, name)
				break;
				
				case "metaProgression":
				global.meta = struct_get(saveData, name)
				break;
				
				case "difficulty":
				global.difficulty = struct_get(saveData, name)
				break;
			} 
		}
		//global.musicAudio = saveData.musicAudio;
		//global.sfxAudio = saveData.sfxAudio;
		//global.meta = saveData.metaProgression;
		//global.difficulty = saveData.difficulty;
	} else {
		//global.musicAudio = 0.2;
		//global.sfxAudio = 0.5;
	}
}
function resetSave() {
    if (file_exists("rscapeSave.txt")) {
		file_delete("rscapeSave.txt");
	}
    show_debug_message("Save deleted.");
}