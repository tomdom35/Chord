function scr_hovering(x_val,y_val,spr){
	return point_in_rectangle(mouse_x,mouse_y,x_val,y_val,x_val+sprite_get_width(spr),y_val+sprite_get_height(spr))
}