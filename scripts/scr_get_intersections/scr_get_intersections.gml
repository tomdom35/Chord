function scr_get_intersections(index1,index2){
	var intersections = [];
	
	for(var i = 0; i < array_length(obj_controller.progress[0]); i++){
		if(index1 == 0){
			if(obj_controller.grid[i][index2] == 2 or obj_controller.grid[i][index2] == 3){
				intersections[array_length(intersections)] = [1,i]
			}
		}
		else{
			if(obj_controller.grid[index2][i] == 2 or obj_controller.grid[index2][i] == 3){
				intersections[array_length(intersections)] = [0,i]
			}
		}
	}
	
	return intersections
}