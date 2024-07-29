extends PointLight2D

@onready var parent = get_parent()

func _ready():
	add_to_group("Lights")
	parent.send_light_children(global_position)


func change_shadow_color(color: int):
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
