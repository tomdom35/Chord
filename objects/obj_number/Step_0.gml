if(active and !obj_controller.mobile_checkbox.checked){
	if(keyboard_check_pressed(vk_backspace)){
		keyboard_string = ""
		first_input = true
	}
	var input = keyboard_string
	var num_input = string_digits(input)
	if(string_length(num_input) > 2){
		num_input = string_copy(num_input,1,2)
	}
	if(string_length(num_input) > 0 and string_char_at(num_input, 1) == "0"){
		num_input = ""
	}
	if(!first_input){
		if(num_input != ""){
			num = real(num_input)
			first_input = true
		}		
	}else{
		if(num_input != ""){
			num = real(num_input)
		}
		else{
			num = 0
		}
	}

	keyboard_string = num_input
}