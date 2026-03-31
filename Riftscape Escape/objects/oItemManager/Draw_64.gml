// ui list of items

var guiW = display_get_gui_width();
var guiH = display_get_gui_height();

var cols = 3;
var iconSize = 16;   
var pad = 12;
var cell = iconSize + pad;

// bottom-right anchor
var startX = guiW - (cols * cell) - 8;
var startY = guiH * 0.25;



for (var i = 0; i < array_length(itemList); i++) {
    var obj = itemList[i];
	var spr = object_get_sprite(obj);
	if (spr == -1) continue;

    var col = i mod cols;
    var row = i div cols;

    var GUIx = startX + col * cell;
    var GUIy = startY + row * cell;


    var scale = 0.5;

	draw_sprite_ext(spr, 0, floor(GUIx), floor(GUIy), scale, scale, 0, c_white, 0.5);

}

if (global.chargeItem != noone) {
    var obj = global.chargeItem.object_index;
    var spr = object_get_sprite(obj);
    
    if (spr != -1) {
        var scale = 2;

        var sprW = sprite_get_width(spr) * scale;
        var sprH = sprite_get_height(spr) * scale;

        var sx = pad;
        var sy = display_get_gui_height() - sprH - pad;

        draw_sprite_ext(spr, 0, sx, sy, scale, scale, 0, c_white, 1);

        // charge values
        var current = global.currentCharges;
        var maxCharges = global.itemCharges;

        // segment settings
        var barPad = -12;
        var segPad = 2;
        var segHeight = 8;

        var totalWidth = sprW;
        var segWidth = (totalWidth - (maxCharges - 1) * segPad) / maxCharges;

        var startItemX = sx;
        var startItemY = sy + sprH + barPad;
		if (current >= maxCharges) {
			draw_set_color(c_white);
			draw_set_font(fLevels);
			draw_text(startItemX, startItemY-sprW, "Click Crtl");
		}
        for (var i = 0; i < maxCharges; i++) {
            var x1 = startItemX + i * (segWidth + segPad);
            var x2 = x1 + segWidth;
            var y1 = startItemY;
            var y2 = y1 + segHeight;

            if (i < current) {
				draw_set_color(c_yellow);
                draw_rectangle(x1, y1, x2, y2, false); // filled
            } else {
				draw_set_color(c_ltgrey);
                draw_rectangle(x1, y1, x2, y2, true);  // empty
            }
        }
    }
}
if (global.currentCharges >= global.itemCharges && keyboard_check_pressed(vk_control) && global.chargeItem != noone) {
	switch (global.chargeItem.object_index) {
		case oDictionaryCharge:
		var i = irandom_range(1, 6);
		
		switch (i) {
			case 1:
			realityUp();
			break;
			
			case 2:
			lifeUp();
			break;
			
			case 3:
			essenceUp();
			break;
			
			case 4:
			timeUp();
			break;
			
			case 5:
			fateUp();
			break;
			
			case 6:
			thoughtUp();
			break;
		}
		break;
		
		case oThePathForward:
		event_user(0);
		break;
	}
	global.currentCharges = 0;
}
  