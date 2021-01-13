solved = array_equals(solution[0],progress[0]) and array_equals(solution[1],progress[1])

if(mouse_check_button_pressed(mb_left) and !mobile_hover and mobile_checkbox.image_blend != c_gray and visuals_checkbox.image_blend != c_gray and !scr_in_mobile_zone()){
	var click_check_obj = instance_position(mouse_x,mouse_y,obj_number)
	if(click_check_obj == noone or !click_check_obj.editable){
		scr_unselect_number()
	}
}

mobile_hover = false