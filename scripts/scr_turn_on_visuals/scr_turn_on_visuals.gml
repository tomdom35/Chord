function scr_turn_on_visuals(_index1,_index2){
	var intersections = scr_get_intersections(_index1,_index2)
	var connection = scr_get_connection(_index1,_index2)
	with(obj_number){
		for(var i = 0; i < array_length(intersections); i++){
			if(index1 == intersections[i][0] and index2 == intersections[i][1]){
				image_blend = c_green
				break
			}
		}
		
		if(index1 == connection[0] and index2 == connection[1]){
			image_blend = c_red	
		}
	}	
}