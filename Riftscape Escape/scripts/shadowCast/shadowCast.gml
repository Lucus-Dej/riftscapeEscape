function draw_light_visibility(lx, ly, radius)
{
    var pts = [];
    var count = 0;

    with (oWall)
    {
        var corners = [
            [bbox_left, bbox_top],
            [bbox_right, bbox_top],
            [bbox_right, bbox_bottom],
            [bbox_left, bbox_bottom]
        ];

        for (var i = 0; i < 4; i++)
        {
            var cx = corners[i][0];
            var cy = corners[i][1];

            var base = point_direction(lx, ly, cx, cy);

            for (var a = -0.1; a <= 0.1; a += 0.1)
            {
                var dir = base + a;

                var ex = lx + lengthdir_x(radius, dir);
                var ey = ly + lengthdir_y(radius, dir);

                var hit = collision_line(lx, ly, ex, ey, oWall, true, true);

                if (hit)
                {
                    ex = hit.x;
                    ey = hit.y;
                }

                pts[count++] = [ex, ey, dir];
            }
        }
    }

    array_sort(pts, function(a,b){ return a[2] - b[2]; });

    draw_primitive_begin(pr_trianglefan);

    draw_vertex(lx, ly);

    for (var i = 0; i < count; i++)
    {
        draw_vertex(pts[i][0], pts[i][1]);
    }

    draw_vertex(pts[0][0], pts[0][1]);

    draw_primitive_end();
}