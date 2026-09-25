// ui list of items
gpu_push_state();
gpu_set_fog(false, 0,0,0)
var guiW = display_get_gui_width();
var guiH = display_get_gui_height();

var mouseX = device_mouse_x_to_gui(0);
var mouseY = device_mouse_y_to_gui(0);

var hoveredItem = noone;

var cols = 4;
var iconSize = 32;   
var pad = 12;
var cell = iconSize + pad;

// bottom-right anchor
var startX = guiW - (cols * cell) - 8;
var startY = guiH * 0.35;
var skipped = 0;

if (!oPlayerManager.inLevelMenu)
for (var i = 0; i < array_length(itemList); i++) {
	var denied = false;
    var obj = itemList[i];
	var r = rarityList[i];
	
	//if (obj == -4) {
		//show_debug_message(i);
		//show_debug_message(itemList[i]);
		//show_debug_message(itemList);
	//}
	if (array_get_index(deniedItemArray, obj) != -1) {
		denied = true;
	}
	var spr = object_get_sprite(obj);
	var raritySprite = raritySpriteList[i];
	if (spr == -1) continue;

    var col = i mod cols;
    var row = i div cols;

    var GUIx = startX + col * cell;
    var GUIy = startY + row * cell;


    var scale = 0.75;
	var alpha = 0.5;
	var w = sprite_get_width(spr) * scale;
	var h = sprite_get_height(spr) * scale;
	if (mouseX >= GUIx - w * 0.5 && mouseX <= GUIx + w * 0.5 && mouseY >= GUIy - h * 0.5 && mouseY <= GUIy + h * 0.5) {
		hoveredItem = obj;
		scale = 1;
		alpha = 1;
		shader_set(shdHit);
		shader_set_uniform_f(shader_get_uniform(shdHit, "flash"), flash);
	}
	
	if (denied) {
		draw_sprite_ext(sDenied, 0, floor(GUIx), floor(GUIy), scale, scale, 0, c_white, alpha);
		draw_sprite_ext(spr, 0, floor(GUIx), floor(GUIy), scale, scale, 0, c_white, 0.1);
		shader_reset();
		draw_sprite_ext(raritySprite, 0, floor(GUIx), floor(GUIy), scale, scale, 0, c_white, alpha);
	} else {
		draw_sprite_ext(spr, 0, floor(GUIx), floor(GUIy), scale, scale, 0, c_white, alpha);
		shader_reset();
		draw_sprite_ext(raritySprite, 0, floor(GUIx), floor(GUIy), scale, scale, 0, c_white, alpha);
	}
	
	
	
}
	
if (hoveredItem != noone) {
	displayItemFunction(hoveredItem);
	if (ritualRerollAvailable && mouse_check_button_pressed(mb_left)) {
		//show_debug_message("hovered item is "+string(hoveredItem));
		itemRemove(hoveredItem);
		var newItem = rollItem(true);
		itemAdd(newItem);
		audio_play_sound(aShatter, 1, false, global.sfxAudio)
		//show_debug_message("newItem item is "+string(newItem));
		ritualRerollAvailable = false;
	}
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

        draw_sprite_ext(spr, 0, sx + sprW * 0.5, sy + sprH * 0.5, scale, scale, 0, c_white, 1);

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


// display item text?
if (displayItemTimer > 0) {
	var alpha = min(displayItemTimer / 20, 1);
	guiW = display_get_gui_width();
	guiH = display_get_gui_height();
	
	var txtW = string_width(itemDesc);
	var txtH = string_height(itemDesc)
	
	var xPos = guiW * 0.5;
	var yPos = guiH * 0.8;
	pad = 64;
	var sprW = sprite_get_width(sItemDescription);
	
	var xScale = (txtW+pad)/sprW;
	
	draw_sprite_ext(sItemDescription, 0, display_get_gui_width()*0.5, display_get_gui_height()*0.8, xScale, 1.5, 0, c_white, alpha);
	draw_set_colour(c_white);
	//drawOutline((guiW*0.5)-txtW/2, (guiH*0.8)-pad/2+8, itemDesc, c_black, c_black)
	draw_text((guiW*0.5)-txtW/2, (guiH*0.8)-pad/2+8, itemDesc);
	displayItemTimer--;
}
gpu_pop_state();