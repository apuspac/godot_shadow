extends PointLight2D

signal send_light_position(light_p: Vector2)


# Called when the node enters the scene tree for the first time.
func _ready():
	send_light_position.emit(global_position)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_player_2_notice_shadow_color(color: int):
	var shadow_color_tmp: Color = Color.WHITE
	if(color == 0):
		shadow_color_tmp = Color.ALICE_BLUE
	elif(color == 1):
		shadow_color_tmp = Color.LIGHT_GREEN
	elif(color == 2):
		shadow_color_tmp = Color.CYAN
	elif(color == 3):
		shadow_color_tmp = Color.MAGENTA

	shadow_color = shadow_color_tmp
