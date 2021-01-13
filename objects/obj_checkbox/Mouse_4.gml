if(!obj_controller.solved){
	checked = !checked
	if(_type == "visuals"){
		var is_checked = checked
		with(obj_number){
			if(editable and active and is_checked){
				scr_turn_on_visuals(index1,index2)
			}
			else if(!is_checked){
				image_blend = c_white
			}
		}
	}
}