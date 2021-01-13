function scr_unselect_number(){
	with(obj_number){
		first_input = false
		image_blend = c_white
		if(editable){
			if(active){
				obj_controller.progress[index1][index2] = num
			}
			active = false
			sprite_index = spr_box
			obj_controller.top_active = false
			obj_controller.bottom_active = false
		}
	}
}