extends Node2D
@onready var heart = $Heart/Heart1

# Called when the node enters the scene tree for the first time.
func _ready():
	change_heart_available()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_change_level_enter_change_area():
	get_tree().change_scene_to_file("res://src/scene/level1.tscn")
	
func change_heart_available():
	if Global.level1_heart[0]:
		heart.is_get_heart = false
	else:
		heart.is_get_heart = true
		heart.visible = false 

		

func _on_heart_1_notice_get_heart():
	Global.level1_heart[0] = false
	heart.is_get_heart = true
