if (room == startScreen) {
	var key = keyboard_lastchar;
	if (key != "") {
		if (string_upper(key) == string_char_at(password, inputIndex + 1)) {
			inputIndex++;
			show_debug_message(key)
	        if (inputIndex >= string_length(password)) {
				var guiy = display_get_gui_height()*0.9;
				var guix = display_get_gui_width()*0.9
				if (!instance_exists(oConquestButton))
				instance_create_layer(guix, guiy, "Instances", oConquestButton)
	            inputIndex = 0; 
	        }
	    } else {
	        inputIndex = 0;
	    }
	}
}
