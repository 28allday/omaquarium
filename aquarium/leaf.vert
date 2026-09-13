VARYING float growthHeight;
void MAIN()
{
    // Colour variation only: the delivered animated vertices are not moved.
    growthHeight = clamp(VERTEX.y / leafHeight, 0.0, 1.0);
}
