count++
if (count >= 120)
{
    fadetoroom(main, 60, 0, 0, 0)
    alpha -= 0.016666666666666666
}
if (alpha <= 0)
    instance_destroy()
