function scr_in_mobile_zone(){
	if(mobile_checkbox.checked){
		return point_in_rectangle(mouse_x,mouse_y,
		mobile_start_x,top_mobile_start_y,
		mobile_start_x+mobile_inc*6,
		top_mobile_start_y+mobile_inc*4) ||
		point_in_rectangle(mouse_x,mouse_y,
		mobile_start_x,bottom_mobile_start_y,
		mobile_start_x+mobile_inc*6,
		bottom_mobile_start_y+mobile_inc*4)
	}
	
	return false
}