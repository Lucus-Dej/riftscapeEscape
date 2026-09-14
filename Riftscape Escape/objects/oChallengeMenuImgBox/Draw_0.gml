draw_self();
if (img != noone) {
	draw_sprite_ext(img, index, x+2, y+2, 7, 7, 0, c_black, 1)
	draw_sprite_ext(img, index, x+2, y-2, 7, 7, 0, c_black, 1)
	draw_sprite_ext(img, index, x-2, y+2, 7, 7, 0, c_black, 1)
	draw_sprite_ext(img, index, x-2, y-2, 7, 7, 0, c_black, 1)
	draw_sprite_ext(img, index, x, y, 7, 7, 0, c_white, 1)
}
