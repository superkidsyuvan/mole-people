move_speed = 4;

tilemap = layer_tilemap_get_id("Tiles_Col");
level = 1;
fireball = false;
audio_play_sound(soundtrack,92627234684,true)

hp_total = 10;
hp = hp_total;
damage = 1;
alarm[1] = room_speed * 2