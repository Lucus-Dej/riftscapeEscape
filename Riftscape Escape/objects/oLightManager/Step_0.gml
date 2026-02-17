//Construct the vertex buffer with every wall
//Instead of using the four edges as the walls, we use the diagonals instead (Optimization)
/*vertex_begin(vb, vf);

with(oSuperwalls)
{
    Quad(other.vb, x, y, x + sprite_width, y + sprite_height);
    Quad(other.vb, x + sprite_width, y, x, y + sprite_height);
}

vertex_end(vb);