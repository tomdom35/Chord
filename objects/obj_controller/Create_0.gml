show_debug_message("testing2")

randomize();

function remove_from_list_by_value(arr,val){
	var new_arr = []
	for(var i = 0; i < array_length(arr); i++){
		if(arr[i] != val){
			new_arr[array_length(new_arr)] = arr[i]
		}
	}
	return new_arr
}

function remove_from_list_by_index(arr, index){
	var new_arr = []
	for(var i = 0; i < array_length(arr); i++){
		if(i != index){
			new_arr[array_length(new_arr)] = arr[i]
		}
	}
	return new_arr	
}

function list_contains(arr,val){
	for(var i = 0; i < array_length(arr); i++){
		if(arr[i] == val){
			return true	
		}
	}
	return false
}

function nested_list_contains(arr,val){
	for(var i = 0; i < array_length(arr); i++){
		if(array_equals(arr[i], val)){
			return true	
		}
	}
	return false
}

function list_count(arr,val){
	var count = 0
	for(var i = 0; i < array_length(arr); i++){
		if(arr[i] == val){
			count++	
		}
	}
	return count
}

function sort_nested_list_by_index(arr,index){
	var cur_arr = []
	var sorted_arr = []
	array_copy(cur_arr,0,arr,0,array_length(arr))
	
	while(array_length(cur_arr) > 0){
		var min_index = 0
		var min_val = array_length(arr)
		
		for(var i = 0; i < array_length(cur_arr); i++){
			if(cur_arr[i][index] < min_val){
				min_val = cur_arr[i][index]
				min_index = i
			}
		}
		sorted_arr[array_length(sorted_arr)] = cur_arr[min_index]
		cur_arr = remove_from_list_by_index(cur_arr,min_index)
	}
	
	return sorted_arr
}

function list_sort(arr){
	var cur_arr = []
	var sorted_arr = []
	array_copy(cur_arr,0,arr,0,array_length(arr))
	
	while(array_length(cur_arr) > 0){
		var min_index = 0
		var min_val = array_length(arr)
		
		for(var i = 0; i < array_length(cur_arr); i++){
			if(cur_arr[i] < min_val){
				min_val = cur_arr[i]
				min_index = i
			}
		}
		sorted_arr[array_length(sorted_arr)] = cur_arr[min_index]
		cur_arr = remove_from_list_by_index(cur_arr,min_index)
	}
	
	return sorted_arr
}

function create_marks(size,offset,radius){
	var dir_inc = (180-(offset*2))/(size-1)
	var arr = [[]]
	var temp_arr = [[]]
	for(var i = 0; i<size; i++){
		var dir = offset+(dir_inc*i)
		var _x = (room_width/2) + lengthdir_x(radius-1,dir)
		var _y = (room_height/2) + lengthdir_y(radius-1,dir)
		temp_arr[i] = [_x,_y]
	}
	for(var i = 0; i < size; i++){
		var index = ((size-1)-i)
		var val = temp_arr[index]
		arr[i] = val
	}
	temp_arr = [[]]
	for(var i = 0; i<size; i++){
		var dir = -offset-(dir_inc*i)
		var _x = (room_width/2) + lengthdir_x(radius-1,dir)
		var _y = (room_height/2) + lengthdir_y(radius-1,dir)
		temp_arr[i] = [_x,_y]
	}
	for(var i = 0; i < size; i++){
		var index = ((size-1)-i)
		var val = temp_arr[index]
		arr[size+i] = val
	}	
	return arr
}

function create_connections(grid){
	var size = array_length(grid)
	var arr = [[]]
	for(var i = 0; i < size; i++){
		for(var j = 0; j < size; j++){
			if(grid[i][j] == 1){
				var bottom = size+i
				var top = j
				arr[i] = [top,bottom]
				break
			}
		}
	}
	return arr
}

function get_row_index(is_first_row, one_index_available){
	var random_index = irandom_range(0,array_length(one_index_available)-1)
	var col_index = one_index_available[random_index]
	
	if(is_first_row and col_index == 0){
		col_index = one_index_available[random_index+1]	
	}
	
	return col_index
}

function update_grid(i, col_index, one_index_used, grid){
	if(i > 0){
		for(var index = 0; index < array_length(one_index_used); index++){
			var val = one_index_used[index]
			if(val > col_index){
				grid[i][val] = 2
				grid[index][col_index] = 2
			}
		}
	}
	grid[i][col_index] = 1
}

function build_grid(size){
	var grid = [[]]
	var one_index_available = []
	var one_index_used = []
	var last_row_col_index = irandom_range(0,size-2)
	for(var i = 0; i < size; i++){
		for(var j = 0; j < size; j++){
			grid[i][j] = 0
		}
		one_index_available[i] = i
	}
	
	one_index_available = remove_from_list_by_value(one_index_available,last_row_col_index)
	
	for(var i = 0; i < size-1; i++){
		var one_check = false
		if(i > 0 and one_index_used[i-1] < size-1 and list_contains(one_index_available,one_index_used[i-1]+1)){
			one_check = true
			one_index_available = remove_from_list_by_value(one_index_available,one_index_used[i-1]+1)
		}
		if(array_length(one_index_available) == 0) break;
		var col_index = get_row_index(i==0,one_index_available)
		update_grid(i,col_index,one_index_used,grid)
		one_index_available = remove_from_list_by_value(one_index_available,col_index)
		if(one_check){
			one_index_available[array_length(one_index_available)] = one_index_used[i-1]+1	
		}
		one_index_used[i] = col_index
	}
	
	update_grid(size-1,last_row_col_index,one_index_used,grid)
	
	return grid
}

function build_solution(grid){
	var size = array_length(grid)
	var bottom = []
	var top = []
	var nums = []
	
	for(var i = 0; i < size; i++){
		nums[i] = i
	}
	
	for(var i = 0; i < size; i++){
		var random_index = irandom_range(0,(size-1)-i)
		var val = nums[random_index]
		top[array_length(top)] = val+1
		nums = remove_from_list_by_value(nums,val)
	}
	
	for(var i = 0; i < size; i++){
		for(var j = 0; j < size; j++){
			if(grid[i][j] == 3){
				var val = top[j]
				bottom[array_length(bottom)] = val
				break
			}
		}			
	}
	
	return [top,bottom]
}

function solvable_grid(grid){
	var size = array_length(grid)
	var num_twos_arr = []
	var twos_arr = []
	var sorted_twos_index = []
	
	for(var index = 0; index < size; index++){
		var two_count = 0
		for(var j = 0; j < size; j++){
			if(grid[index][j] == 2){
				two_count += 1	
			}
		}
		num_twos_arr[array_length(num_twos_arr)] = [index,two_count]
	}
	
	num_twos_arr = sort_nested_list_by_index(num_twos_arr,1)
	
	for(var i = 0; i < array_length(num_twos_arr); i++){
		sorted_twos_index[i] = num_twos_arr[i][0]	
	}
	
	for(var i = 0; i < array_length(sorted_twos_index); i++){
		var twos_index = []
		var val = sorted_twos_index[i]
		
		for(var index = 0; index < size; index++){
			var j = grid[val][index]
			if(j == 2 and not list_contains(twos_arr,index)){
				twos_index[array_length(twos_index)] = index
			}
		}
		
		if(array_length(twos_index) == 0){
			return false	
		}
		
		var random_index = irandom_range(0, array_length(twos_index)-1)
		var two_index = twos_index[random_index]
		grid[val][two_index] = 3
		twos_arr[array_length(twos_arr)] = two_index
	}
	
	return true
}

function print_grid(grid){
	show_debug_message("")	
	for(var i = 0; i < array_length(grid); i++){
		show_debug_message(grid[i])	
	}
	show_debug_message("")	
}

function flatten_grid(grid){
	var size = array_length(grid)
	var flat_grid = []
	var index = 0
	
	for(var i = 0; i < size; i++){
		for(var j = 0; j < size; j++){
			flat_grid[index] = grid[i][j]
			index++
		}
	}
	
	return flat_grid
}

function get_intersections(index1, index2, grid, solution){
	var size = array_length(grid)
	var int_vals = []
	for(var j = 0; j < size; j++){
		if((index1 == 0 and (grid[j][index2] == 2 or grid[j][index2] == 3)) or 
		(index1 == 1 and (grid[index2][j] == 2 or grid[index2][j] == 3))){
			int_vals[array_length(int_vals)] = solution[!index1][j]
		}
	}
	return int_vals
}


function get_connections(grid, solution){
	var size = array_length(grid)
	var connections = []
	for(var i = 0; i < size; i++){
		for(var j = 0; j < size; j++){
			if(grid[i][j] == 1){
				var c_top = solution[0][j]
				var c_bot = solution[1][i]
				connections[array_length(connections)] = [c_top,c_bot]
				break
			}
		}		
	}
	return connections
}

function get_connecting_val(index1, val, connections){
	for(var k = 0; k < array_length(connections); k++){
		if(connections[k][index1] == val) return connections[k][!index1]
	}
}


function generate_puzzle(difficulty,size){
	var done = false
	var inc = floor(size/4)
	var min_num_zeros = size+1
	var max_num_zeros = size+1
	var solution = []
	var progress = []
	var seen_grids = []
	
	if(difficulty < 4){
        max_num_zeros = size - (difficulty*inc)
        min_num_zeros = max_num_zeros - (inc-1)
	}
	
	var num_zeros = irandom_range(min_num_zeros,max_num_zeros)

	var c1 = 0
	var grid = []
	var intersection_list = []
	var top_intersection_vals = []
	var bottom_intersection_vals = []
	var bottom_missing = []
	var removed_index = 0
	var removed_value = 0
	var top = true
	while(not done){
		var grid_indicies = []
		for(var i = 0; i < size*2; i++){
			grid_indicies[i] = i	
		}
		
		var top_grid_indicies = []
		for(var i = 0; i < size; i++){
			top_grid_indicies[i] = i	
		}
		
		var bottom_grid_indicies = []
		for(var i = 0; i < size; i++){
			bottom_grid_indicies[i] = i	
		}

		c++
		c1++
		
		var grid = build_grid(size)
		var flat_grid = flatten_grid(grid)
		
		while(not solvable_grid(grid) or nested_list_contains(seen_grids,flat_grid)){
			c1++
			grid = build_grid(size)
			flat_grid = flatten_grid(grid)
		}
		
		var new_index = array_length(seen_grids)
		seen_grids[new_index] = flat_grid

		solution = build_solution(grid)
		progress = [[],[]]
		array_copy(progress[0],0,solution[0],0,array_length(solution[0]))
		array_copy(progress[1],0,solution[1],0,array_length(solution[1]))
		
		top_intersection_vals = []
		bottom_intersection_vals = []
		top_missing = []
		bottom_missing = []
		top = true
		
		done = true
		
		var intersections_list = []
		var valid_ints = true
		var low_ints_size = ceil(size/2)
		
		for(var i = 0; i < 2; i++){
			intersection_list[i] = []
			var full_ints = 0
			var full_ints_2 = 0
			var low_ints = 0
			for(var j = 0; j < size; j++){
				var int_vals = get_intersections(i,j,grid,solution)
				var s = array_length(int_vals)
				if(s == size-1) full_ints++
				if(s == size-2) full_ints_2++
				if(s < low_ints_size) low_ints++
				if(full_ints > 1 or full_ints_2 == 4){
					valid_ints = false
					break;
				}
				intersections_list[i][j] = int_vals
			}
			if(low_ints == 0){
				valid_ints = false
			}
			if(!valid_ints){
				break
			}
		}
		
		if(!valid_ints){
			done = false
			continue
		}
		
		
		var connections = get_connections(grid,solution)
		
		var top_option_vals = []
		var bottom_option_vals = []
		var top_indicies = []
		var bottom_indicies
		
		for(var i = 0; i < size; i++){
			top_option_vals[i] = i+1
			bottom_option_vals[i] = i+1
			top_indicies[i] = i
			bottom_indicies[i] = i
		}
		
		for(var i = 0; i < num_zeros; i++){
			show_debug_message(" ")
			show_debug_message(i)
			top = !top
			var index1 = 0
			var index2 = -1
			
			if(array_length(top_option_vals) == 0 and array_length(bottom_option_vals) == 0){
				done = false
				break;
			}
			
			if(!top and array_length(bottom_option_vals) == 0) top = true
			
			
			if(top and array_length(top_option_vals) > 0){
				var min_index = -1
				var min_intersections = size
				var min_val = 0
				
				for(var j = 0; j < size; j++){
					var len = array_length(intersections_list[index1][j])
					var val = progress[index1][j]
					if(len < min_intersections and list_contains(top_option_vals,val)){
						min_intersections = len
						min_index = j
						min_val = val
					}
				}
				
				index2 = index_of(progress[index1],min_val)
				top_option_vals = remove_from_list_by_value(top_option_vals, min_val)
			}
			if((!top or array_length(top_option_vals) == 0) and array_length(bottom_option_vals) > 0 and index2 == -1){
				index1 = 1
				
				var min_index = -1
				var min_intersections = size
				var min_val = 0
				
				for(var j = 0; j < size; j++){
					var len = array_length(intersections_list[index1][j])
					var val = progress[index1][j]
					if(len < min_intersections and list_contains(bottom_option_vals,val)){
						min_intersections = len
						min_index = j
						min_val = val
					}
				}
				
				index2 = index_of(progress[index1],min_val) //should be min_index
				bottom_option_vals = remove_from_list_by_value(bottom_option_vals, min_val)
				
			}
			
			if(index2 == -1){
				done = false
				break
			}
			
				
			if(index1 == 0){
				top_missing[array_length(top_missing)] = progress[index1][index2]
				top_indicies = remove_from_list_by_index(top_indicies,index2)
			}else{
				bottom_missing[array_length(bottom_missing)] = progress[index1][index2]
				bottom_indicies = remove_from_list_by_index(bottom_indicies,index2)
			}
			removed_value = progress[index1][index2]
			removed_index = index2
			progress[index1][index2] = 0
			var copy_progress = [[],[]]
			array_copy(copy_progress[0],0,progress[0],0,array_length(progress[0]))
			array_copy(copy_progress[1],0,progress[1],0,array_length(progress[1]))
			var zero_count1 = list_count(progress[0],0)
			var zero_count2 = list_count(progress[1],0)
			var cur_solution = puzzle_solver(grid,copy_progress,zero_count1+zero_count2)
			show_debug_message(cur_solution)
			show_debug_message(solution)
			
			if(not (array_equals(cur_solution[0],solution[0]) and array_equals(cur_solution[1],solution[1]))){
				i -= 1
				show_debug_message(i)
				progress[index1][index2] = removed_value
				if(index1 == 0) top_missing = remove_from_list_by_value(top_missing,removed_value)
				else bottom_missing = remove_from_list_by_value(bottom_missing,removed_value)
				continue
			}else{
				if(index1 == 0){
					var cur_intersections = intersections_list[index1][index2]
				
					for(var j = 0; j < array_length(cur_intersections); j++){
						var cur_int = cur_intersections[j]
						var connection = get_connecting_val(index1,cur_int,connections)
						if(cur_int != min_val or connection != min_val){
							top_option_vals = remove_from_list_by_value(top_option_vals, cur_int)
						}
					}
				}else if(index1 ==1){
					var cur_intersections = intersections_list[index1][index2]
				
					for(var j = 0; j < array_length(cur_intersections); j++){
						var cur_int = cur_intersections[j]
						var connection = get_connecting_val(index1,cur_int,connections)
						if(cur_int != min_val or connection != min_val){
							bottom_option_vals = remove_from_list_by_value(bottom_option_vals, cur_int)
						}
					}					
				}
			}
		}
	}
	
	return[grid,solution,progress]
}

function puzzle_solver(grid, progress, zero_count){
	if(zero_count == 0){
		return progress	
	}

	for(var p_idx = 0; p_idx < array_length(progress); p_idx++){
		var p = progress[p_idx]
		for(var index = 0; index < array_length(p); index++){
			var val = p[index]
			var options = []
			var missing = []
			var non_options = []
			var implied_index = -1
			
			if(val !=0){
				implied_index = p_idx == 0 ? get_top_implied_index(grid,progress,index,val)	: get_bottom_implied_index(grid,progress,index,val)
			} else{
				if(list_count(p,0) == 1){
					find_last_num(p,options)	
				} else{
					options = p_idx == 0 ? get_top_options(grid,progress,index) : get_bottom_options(grid,progress,index)
					non_options = p_idx == 0 ? get_top_non_options(grid,progress,index) : get_bottom_non_options(grid,progress,index)
				}
			}
			
			if(implied_index != -1){
				var p_idx_val = p_idx == 0 ? 1 : 0
				progress[p_idx_val][implied_index] = val
				return puzzle_solver(grid,progress,zero_count-1)
			}
			
			for(var i = 0; i < array_length(non_options); i++){
				var nop = non_options[i]
				if(list_contains(missing,nop)){				
					remove_from_list_by_value(missing,nop)	
				}
			}
			
			if(array_length(missing) == 1){
                progress[p_idx][index] = missing[0]
                return puzzle_solver(grid,progress,zero_count-1)
			}
			
			for(var idx = 0; idx < array_length(p); idx++){
				var i = p[idx]
				if(i > 0){
					if(list_contains(options,i)){
						remove_from_list_by_value(options,i)	
					}
				}
			}
			
			if(array_length(options) == 1 and not array_equals(options,[0])){
                progress[p_idx][index] = options[0]
                return puzzle_solver(grid,progress,zero_count-1)				
			}
		}
	}
	return progress
}

function get_top_options(grid, progress, col){
    var options = []
    for(var index = 0; index < array_length(grid); index++){
		var row = grid[index]
        if(row[col] == 2 or row[col] == 3){
            options[array_length(options)] = progress[1][index]
		}
	}
	return options
}

function get_top_non_options(grid, progress, col){
	var non_options = []
    for(var index = 0; index < array_length(grid); index++){
		var row = grid[index]
        if((row[col] == 1 or row[col] == 0) and progress[1][index] != 0){
            non_options[array_length(non_options)] = progress[1][index]
		}
	}
	return non_options
}

function get_top_implied_index(grid, progress, col, val){
	var zero_index = -1
    for(var index = 0; index < array_length(grid); index++){
		var row = grid[index]
        if(row[col] == 2 or row[col] == 3){
			if(progress[1][index] == 0){
				if(zero_index == -1){
					zero_index = index	
				} else{
					return -1	
				}
			} else if(progress[1][index] == val) {
				return -1
			}
		}
	}
	return zero_index
}


function get_bottom_options(grid, progress, row){
    var options = []
    for(var col = 0; col < array_length(grid[row]); col++){
		var val = grid[row][col]
        if(val == 2 or val == 3){
            options[array_length(options)] = progress[0][col]
		}
	}
    return options
}

function get_bottom_non_options(grid, progress, row){
    var non_options = []
    for(var col = 0; col < array_length(grid[row]); col++){
		var val = grid[row][col]
        if((val == 1 or val == 0) and progress[0][col] != 0){
            non_options[array_length(non_options)] = progress[0][col]
		}
	}
    return non_options
}

function get_bottom_implied_index(grid, progress, row, val){
	var zero_index = -1
	for(var index = 0; index < array_length(grid[row]); index++){
		var col_val = grid[row][index]
		if(col_val == 2 or col_val == 3){
			if(progress[0][index] == 0){
				if(zero_index == -1){
					zero_index = index	
				} else{
					return -1	
				}
			} else if(progress[0][index] == val){
				return -1	
			}
		}
	}
	return zero_index
}

function find_last_num(p, options){
    var size = array_length(p)
    var temp = list_sort(p)
	var nums = []
	for(var i = 0; i < size; i++){
		nums[i] = i	
	}
    if(array_equals(temp,nums)){
        options[array_length(options)] = size
	}
    else{
        for(var i = 0; i < size; i++){
            if(i != temp[i]){
                options[array_length(options)] = i
                break
			}
		}
	}
}

function create_new_puzzle(){
	instance_destroy(obj_number)
	show_debug_message("test")
	puzzle = generate_puzzle(difficulty,size)
	grid = puzzle[0]
	solution = puzzle[1]
	progress = puzzle[2]
	number_locations = create_marks(size, offset, radius + radius_offset)
	marks_location = create_marks(size,offset,radius)
	connections = create_connections(grid)

	for(var i = 0; i < size*2; i++){
		var _x = number_locations[i][0]
		var _y = number_locations[i][1]

		var index1 = 0
		var index2 = i
	
		if(i >= size){
			index1 = 1
			index2 = i - size
		}
	
		var num = progress[index1][index2]
	
		var s = instance_create_depth(_x,_y,-1,obj_number)
	
		if(num == 0){
			s.editable = true;
			s.sprite_index = spr_box
		}
		s.index1 = index1
		s.index2 = index2
		s.num = num
	}		
	print_grid(grid)
}

function index_of(arr,val){
	var index = 0
	for(var i = 0; i < array_length(arr); i++){
		if(arr[i] == val){
			return index	
		}
		index++
	}
	return -1
}

radius = room_width/2.5
radius_offset = 35
thickness = 4
offset = 10
size = obj_menu_controller.size
difficulty = scr_get_difficulty()
puzzle = []
grid = []
solution = []
progress = []
number_locations = []
marks_location = []
connections = []
c = 0

create_new_puzzle()
start_progress = [[],[]]
array_copy(start_progress[0],0,progress[0],0,size)
array_copy(start_progress[1],0,progress[1],0,size)

instance_create_depth(10,10,0,obj_back_button)
instance_create_depth(18,65,0,obj_clear_button)
instance_create_depth(13,108,0,obj_new_button)
var check_visuals = instance_nearest(room_width-55,10,obj_checkbox)
var check_mobile = instance_nearest(room_width-55,57,obj_checkbox)
visuals_checkbox = instance_exists(check_visuals) ? check_visuals : instance_create_depth(room_width-55,10,0,obj_checkbox)
mobile_checkbox = instance_exists(check_mobile) ? check_mobile : instance_create_depth(room_width-55,57,0,obj_checkbox)
visuals_checkbox._type = "visuals"
mobile_checkbox._type = "mobile"
var count = 1

top_mobile_start_y = 30
bottom_mobile_start_y = 780
mobile_inc = 45
mobile_start_x = 210

for(var i = 0; i < 3; i++){
	var x_val = mobile_start_x
	var y_val = top_mobile_start_y  + (i*mobile_inc)
	
	var y_val_2 = bottom_mobile_start_y + (i*mobile_inc)
	
	for(var j = 0; j < 5; j++){
		var b = instance_create_depth(x_val + (j*mobile_inc),y_val,0,obj_mobile_number)
		var b_2 = instance_create_depth(x_val + (j*mobile_inc),y_val_2,-5,obj_mobile_number)
		b.num = count
		b.top = true
		b_2.num = count
		b_2.top = false
		count++
	}
}

top_active = false
bottom_active = false
mobile_hover = false

obj_menu_controller.loading = false

solved = false

instance_create_depth(5,room_height-80,-5,obj_main_menu_button)
instance_create_depth(room_width-270,room_height-80,-5,obj_new_puzzle_button)
instance_create_depth(0,0,-4,obj_solved)