function draw_shadow_edge(x1,y1,x2,y2,lx,ly)
{
    var far = 2000;

    var dir1 = point_direction(x1,y1,lx,ly);
    var dir2 = point_direction(x2,y2,lx,ly);

    var fx1 = x1 - lengthdir_x(far, dir1);
    var fy1 = y1 - lengthdir_y(far, dir1);

    var fx2 = x2 - lengthdir_x(far, dir2);
    var fy2 = y2 - lengthdir_y(far, dir2);

    draw_primitive_begin(pr_trianglestrip);

    draw_vertex(x1,y1);
    draw_vertex(x2,y2);
    draw_vertex(fx1,fy1);
    draw_vertex(fx2,fy2);

    draw_primitive_end();
}
function shadow_if_facing_away(x1,y1,x2,y2,lx,ly)
{
    var edgeDir = point_direction(x1,y1,x2,y2);
    var lightDir = point_direction(x1,y1,lx,ly);

    var diff = angle_difference(edgeDir, lightDir);

    // Only cast shadow if facing away
    if (diff > 0)
    {
        draw_shadow_edge(x1,y1,x2,y2,lx,ly);
    }
}