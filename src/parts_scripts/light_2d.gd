extends PointLight2D
signal send_light_position(light_position: Vector2)


func _ready():
	send_light_position.emit(global_position)

#
#func _on_player_2_notice_shadow_color(color: int):
	#var shadow_color_tmp: Color = Color.WHITE
	#if(color == 0):
		#shadow_color_tmp = Color.ALICE_BLUE
	#elif(color == 1):
		#shadow_color_tmp = Color.LIGHT_GREEN
	#elif(color == 2):
		#shadow_color_tmp = Color.CYAN
	#elif(color == 3):
		#shadow_color_tmp = Color.MAGENTA
#
	#shadow_color = shadow_color_tmp
