var hovering = scr_hovering(x,y,spr_dropdown_button)
var col = c_white
if(hovering){
	draw_set_color(c_gray)
	col = c_gray
	if(mouse_check_button_released(mb_left)){
		if(active){
			if(obj_menu_controller.active_dropdown_type == "size" and _type = "diff"){}
			else if(obj_menu_controller.dropdown_open){
				scr_close_dropdown()
			}
			else{
				scr_open_dropdown()
			}
		}
		else{
			var type_check = _type
			with(obj_button_dropdown){
				if(active and _type == type_check) active = false
			}
			x = x_pos
			y = y_pos
			active = true
			if(_type = "size") obj_menu_controller.size = num
			if (_type = "diff") obj_menu_controller.difficulty = num
			scr_close_dropdown()
		}
	}
}

if(active){
	draw_sprite_ext(spr_dropdown_button,0,x,y,1,1,0,col,1)
}
else{
	draw_sprite_ext(spr_dropdown_option,0,x,y,1,1,0,col,1)
}
draw_text(x+25,y+3,string(num))
draw_set_color(c_white)