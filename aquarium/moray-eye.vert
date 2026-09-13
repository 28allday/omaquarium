VARYING vec2 irisPosition;
void MAIN()
{
    irisPosition = vec2((VERTEX.z - 0.27555) / 0.00360,
                        (VERTEX.y - 0.01064) / 0.00340);
}
