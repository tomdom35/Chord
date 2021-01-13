var cur_sprite = scr_get_tutorial_sprite(index)
draw_sprite(cur_sprite,0,0,0)
draw_set_font(fnt_menu)
draw_text((room_width/2) - 45,room_height - 50, string(index) + "/10")