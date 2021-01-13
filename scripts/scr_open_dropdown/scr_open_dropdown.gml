function scr_open_dropdown(){
	y_val = y_pos + 50
	for(var i = _start; i < _end; i++){
		var b = instance_create_depth(x_pos, y_val + (50*(i-_start)),depth,obj_button_dropdown)
		b.num = i
		b.x_pos = x_pos
		b.y_pos = y_pos
		b._start = _start
		b._end = _end
		b._type = _type
	}
	obj_menu_controller.dropdown_open = true
	obj_menu_controller.active_dropdown_type = _type
}