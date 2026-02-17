var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

hover = mx > x - width * 0.5 && mx < x + width * 0.5 && my > y - height * 0.5 && my < y + height * 0.5;

if (hover && mouse_check_button_pressed(mb_left)) {
    with (menu) {
        buttonPressed(other.index);
    }
}
