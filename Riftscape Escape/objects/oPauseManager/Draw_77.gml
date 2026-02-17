gpu_set_blendenable(false);

if (pause) {
    if (surface_exists(pauseSurf)) {
        draw_surface(pauseSurf, 0, 0);
    }
}


draw_set_alpha(0.4);
draw_set_color(c_black);
draw_rectangle(0,0,resW,resH,false);
draw_set_alpha(1);
gpu_set_blendenable(true);