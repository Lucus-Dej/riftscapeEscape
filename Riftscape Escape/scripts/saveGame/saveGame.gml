function saveGame(){
	var saveData = {
		musicAudio: global.musicAudio,
		sfxAudio: global.sfxAudio,
		metaProgression: global.meta,
		difficulty: global.difficulty,
		lifestats: global.lifestats
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
		var names = ["musicAudio", "sfxAudio", "metaProgression", "difficulty", "lifestats"];
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
				mergeStruct(global.meta, struct_get(saveData, name));
				break;
				
				case "difficulty":
				global.difficulty = struct_get(saveData, name)
				break;
				
				case "lifestats":
				mergeStruct(global.lifestats, struct_get(saveData, name));
				show_debug_message("THIS IS THE LIFESTATS"+string(global.lifestats))
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
function mergeStruct(_base, _save) {
	var keys = variable_struct_get_names(_save);

	for (var i = 0; i < array_length(keys); i++) {
		var key = keys[i];
		var saveValue = struct_get(_save, key);

		if (is_struct(saveValue) && variable_struct_exists(_base, key)) {
			var baseValue = struct_get(_base, key);

			if (is_struct(baseValue)) {
				mergeStruct(baseValue, saveValue);
				continue;
			}
		}

		struct_set(_base, key, saveValue);
	}
}
function resetSave() {
    if (file_exists("rscapeSave.txt")) {
		file_delete("rscapeSave.txt");
	}
    show_debug_message("Save deleted.");
}