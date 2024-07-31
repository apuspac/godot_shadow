extends Node2D
@onready var pause_panel = $CanvasLayer/Pause_panel
@onready var in_game_ui = $CanvasLayer/in_game_ui
@onready var heart = $Heart/Heart1
var paused = false

# Called when the node enters the scene tree for the first time.
func _ready():
	change_heart_available()

func _process(delta):
	if Input.is_action_just_pressed("Escape"):
		pause_menu()
	if Input.is_action_just_pressed("Reset"):
		reset_scene()

# pause menu function
func pause_menu():
	if paused:
		pause_panel.hide()
		Engine.time_scale = 1
	else:
		pause_panel.show()
		Engine.time_scale = 0
	
	paused = !paused


func _on_pause_panel_jump_level_select():
	Engine.time_scale = 1
	paused = !paused
	get_tree().change_scene_to_file("res://src/scene/level_select.tscn")
	


func _on_pause_panel_jump_main_menu():
	Engine.time_scale = 1
	paused = !paused
	get_tree().change_scene_to_file("res://src/scene/main_menu.tscn")
	

func reset_scene():
	get_tree().reload_current_scene() 


func _on_change_level_enter_change_area():
	get_tree().change_scene_to_file("res://src/scene/level1.tscn")



### heart
func change_heart_available():
	if Global.level1_heart[2]:
		heart.is_get_heart = false
	else:
		heart.is_get_heart = true
		heart.visible = false 

		

func _on_heart_1_notice_get_heart():
	Global.level1_heart[2] = false
	heart.is_get_heart = true
	in_game_ui.update_item_heart()
