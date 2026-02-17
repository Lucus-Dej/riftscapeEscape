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
