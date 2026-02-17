draw_set_color(hover ? c_yellow : c_gray);
draw_rectangle(x - width * 0.5, y - height * 0.5, x + width * 0.5, y + height * 0.5, false);

draw_set_color(c_white);

var label = "??";
if (instance_exists(menu)) {
	label = menu.upgradeNames[index];
}

draw_text(
    x - string_width(label) * 0.5,
    y - 8,
    label
	//"Upgrade " + string(index + 1)
);
