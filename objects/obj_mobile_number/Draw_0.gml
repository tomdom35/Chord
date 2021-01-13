var spr_x = x - sprite_get_width(spr_box)/2
var spr_y = y - sprite_get_height(spr_box)/2
var hovering = scr_hovering(spr_x,spr_y,spr_box)
var active_num = scr_get_active_num()

if(hovering){
	obj_controller.mobile_hover = true
	var n = num
	if(active_num == num){
		draw_sprite_ext(spr_box,0,x,y,1,1,0,c_white,1)
		draw_set_color(c_white)
		n = ""
	}
	else{
		draw_sprite_ext(spr_box_white,0,x,y,1,1,0,c_white,1)
		draw_set_color(c_black)
	}
	if(mouse_check_button_pressed(mb_left)){
		with(obj_number){
			if(active){
				num = n	
			}
		}
		scr_unselect_number()
	}
}
else{
	if(active_num == num){
		draw_sprite_ext(spr_box_white,0,x,y,1,1,0,c_white,1)
		draw_set_color(c_black)
	}
	else{
		draw_sprite_ext(spr_box,0,x,y,1,1,0,c_white,1)
		draw_set_color(c_white)		
	}
}

draw_text(x,y,num)
draw_set_color(c_white)