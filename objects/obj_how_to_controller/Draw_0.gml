draw_set_font(fnt_how_to_title)
draw_text((room_width/2) - 165,5,"How To Play")

var cur_y = start_y
draw_set_font(fnt_how_to_header)
draw_text(header_x, cur_y, "Overview")

cur_y += point_y_inc
draw_set_font(fnt_how_to_text)
draw_text(text_x, cur_y, "- A puzzle of size 'N' will have 'N' numbers")
cur_y += text_y_inc
draw_text(text_x, cur_y, "   on the top half of the circle, and 'N'")
cur_y += text_y_inc
draw_text(text_x, cur_y, "   numbers on the bottom half of the circle.")

cur_y += point_y_inc
draw_text(text_x, cur_y, "- Depending on the difficulty of the puzzle,")
cur_y += text_y_inc
draw_text(text_x, cur_y, "   some numbers will be left blank.")

cur_y += point_y_inc
draw_text(text_x, cur_y, "- To solve a puzzle, each of the blanks")
cur_y += text_y_inc
draw_text(text_x, cur_y, "   must be set to the correct number, so that")
cur_y += text_y_inc
draw_text(text_x, cur_y, "   all of the numbers are filled in.")

cur_y += section_y_inc
draw_set_font(fnt_how_to_header)
draw_text(header_x, cur_y, "Rules")

cur_y += point_y_inc
draw_set_font(fnt_how_to_text)
draw_text(text_x, cur_y, "- The numbers 1 - 'N' must be represented")
cur_y += text_y_inc
draw_text(text_x, cur_y, "   on the top and bottom halfs of the circle")

cur_y += point_y_inc
draw_text(text_x, cur_y, "- Every number on one half of the circle")
cur_y += text_y_inc
draw_text(text_x, cur_y, "   will be directly connect to a number on")
cur_y += text_y_inc
draw_text(text_x, cur_y, "   the other half of the circle via a line.")

cur_y += point_y_inc
draw_text(text_x, cur_y, "- If two numbers are directly connected,")
cur_y += text_y_inc
draw_text(text_x, cur_y, "   they cannot be the same value.")

cur_y += point_y_inc
draw_text(text_x, cur_y, "- Each number must be equal to another")
cur_y += text_y_inc
draw_text(text_x, cur_y, "   number on the oposite side of the circle")
cur_y += text_y_inc
draw_text(text_x, cur_y, "   which it's line intersects with.")
