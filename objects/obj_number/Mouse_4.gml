if(editable and !obj_controller.solved){
	scr_unselect_number()
	//var input_num = num == 0 ? "" : string(num)
	keyboard_string = ""//input_num
	active = true
	sprite_index = spr_box_white
	first_input = false
	if(index1 == 0) obj_controller.top_active = true
	else obj_controller.bottom_active = true
	
	if(obj_controller.visuals_checkbox.checked){
		scr_turn_on_visuals(index1,index2)
	}
}