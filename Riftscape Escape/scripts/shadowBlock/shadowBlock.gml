function cast_wall_shadows(lx, ly)
{
    var maxdist = 2000;

    with (oWall)
    {
        var corners = [
            [bbox_left, bbox_top],
            [bbox_right, bbox_top],
            [bbox_right, bbox_bottom],
            [bbox_left, bbox_bottom]
        ];

        for (var c = 0; c < 4; c++)
        {
            var cx = corners[c][0];
            var cy = corners[c][1];

            // Only cast if visible
            if (!collision_line(lx, ly, cx, cy, oWall, true, true))
            {
                var baseDir = point_direction(lx, ly, cx, cy);

                for (var a = -0.01; a <= 0.01; a += 0.01)
                {
                    var dir = baseDir + a;

                    var ex = cx + lengthdir_x(maxdist, dir);
                    var ey = cy + lengthdir_y(maxdist, dir);

                    draw_triangle(cx, cy, ex, ey,
                                  cx + lengthdir_x(maxdist, dir + 0.01),
                                  cy + lengthdir_y(maxdist, dir + 0.01),
                                  false);
                }
            }
        }
    }
}