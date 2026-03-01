if (keyboard_check_pressed(vk_shift) and place_meeting(x, y, oPage))
{
    create_dialog
    ([
    {
        name: "Page 1",
        msg: "Col 1 Row 6-9"
    }
    ])
}

if(place_meeting(x, y, oFireBall))
{
    create_dialog
    ([
    {
        name: "FireBall",
        msg: "You have the ability to shoot fireball, but you cannot slash for this duration"
    }
    ])
    fireball = true;
}


var _hor = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _ver = keyboard_check(ord("S")) - keyboard_check(ord("W"));
move_and_collide(_hor * move_speed, _ver * move_speed, tilemap, undefined, undefined, undefined, move_speed, move_speed);
if(_ver != 0 or _hor != 0)
{
    if(_ver > 0) sprite_index = spr_player_walk_down; 
    else if(_ver < 0) sprite_index = spr_player_walk_up;
    else if(_hor > 0) sprite_index = spr_player_walk_right;
    else if(_hor < 0) sprite_index = spr_player_walk_left;
}
else
{
    if(sprite_index == spr_player_walk_down) sprite_index = spr_player_idle_down;
    else if(sprite_index == spr_player_walk_up) sprite_index = spr_player_idle_up;
    else if(sprite_index == spr_player_walk_right) sprite_index = spr_player_idle_right;
    else if(sprite_index == spr_player_walk_left) sprite_index = spr_player_idle_left;
}
if(fireball == false)
{
    if(keyboard_check_pressed(vk_space)) 
    {
        var _inst = instance_create_depth(x, y, depth, oAttack);
        if(sprite_index == spr_player_walk_down or sprite_index == spr_player_idle_down) _inst.image_angle = point_direction(0, 0, 0, 1); 
        else if(sprite_index == spr_player_walk_up or sprite_index == spr_player_idle_up) _inst.image_angle = point_direction(0, 0, 0, -1); 
        else if(sprite_index == spr_player_walk_right or sprite_index == spr_player_idle_right) _inst.image_angle = point_direction(0, 0, 1 , 0);
        else if(sprite_index == spr_player_walk_left or sprite_index == spr_player_idle_left) _inst.image_angle = point_direction(0, 0, -1 , 0);
        _inst.damage *= damage;
    }
}
else
{
    if(keyboard_check_pressed(vk_space))
    {
        var _inst = instance_create_depth(x, y, depth, oFireBallAnimation);
        if(sprite_index == spr_player_walk_down or sprite_index == spr_player_idle_down) _inst.image_angle = point_direction(0, 0, 0, 1); 
        else if(sprite_index == spr_player_walk_up or sprite_index == spr_player_idle_up) _inst.image_angle = point_direction(0, 0, 0, -1); 
        else if(sprite_index == spr_player_walk_right or sprite_index == spr_player_idle_right) _inst.image_angle = point_direction(0, 0, 1 , 0);
        else if(sprite_index == spr_player_walk_left or sprite_index == spr_player_idle_left) _inst.image_angle = point_direction(0, 0, -1 , 0);
        _inst.damage *= damage;
    }
}