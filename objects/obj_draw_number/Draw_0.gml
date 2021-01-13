if(parent_object.num != 0){
	draw_set_halign(fa_center)
	draw_set_valign(fa_center)
	draw_set_font(fnt_numbers)
	if(parent_object.active){
		draw_set_color(c_black)	
	}
	else{
		draw_set_color(parent_object.image_blend)	
	}
	draw_text(x,y,parent_object.num)
	draw_set_color(c_white)	
}