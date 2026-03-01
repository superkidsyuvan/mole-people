if(alarm[0] < 0)
{
    hp -= other.damage;
    alarm[0] = 60;
    image_blend = c_red;
    
    if (hp <= 0)
    {
        room_restart();
        if(level == 1)
        {
            x = 96;
            y = 176;
        }
        else if(level == 2)
        {
            x = 2912;
            y= 1456;
        }
        hp = hp_total
        fireball = false;
    }
}