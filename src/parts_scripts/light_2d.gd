extends PointLight2D

@onready var parent = get_parent()
var light_id

func _ready():
	add_to_group("Lights")
	light_id = parent.add_unique_key()
	parent.send_light_children(global_position, light_id)
	#print_debug(light_id)


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

func change_on_light(lid: int):
	if light_id == lid :
		shadow_enabled = true
		
	else:
		shadow_enabled = false
