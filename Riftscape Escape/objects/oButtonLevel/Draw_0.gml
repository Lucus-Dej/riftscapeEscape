draw_self();
draw_set_colour(c_white);
draw_set_font(fLevels);
if (buttonID == 13) {
	drawText = global.time;
} else if (buttonID == 20) {
	var diff = "";
	switch (global.difficulty) {
		case 1:
		diff = "Easy";
		break
		
		case 2:
		diff = "Normal";
		break;
		
		case 3:
		diff = "Hard";
		break;
		
		case 4: 
		diff = "Rift Breaker";
	}
	drawText = "Current Difficulty Level: "+string(diff);
}

if (drawText != noone && buttonID != 13) {
	draw_text_ext_transformed(x-string_width(drawText), y-sprite_height*0.2, drawText, 4, 256, 2, 2, 0);
} else if (drawText != noone && buttonID == 13) {
	draw_text_ext_transformed(x-string_width(drawText), y-string_height(drawText)*1.35, drawText, 4, 256, 2, 2, 0);
}
