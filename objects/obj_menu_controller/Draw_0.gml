if(room == rm_main_menu){
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite(spr_title,0,room_width/2,80)
	draw_set_font(fnt_menu)
	draw_text(size_dropdown_x-100,size_dropdown_y,"Size:")
	draw_text(diff_dropdown_x-200,diff_dropdown_y,"Difficulty:")
}

if(loading)draw_sprite(spr_loading,0,0,0)