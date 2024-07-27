extends Node2D

@onready var pause_panel = $Camera2D/Pause_panel
@onready var heart1 = $Heart
var paused = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Escape"):
		pause_menu()
	if Input.is_action_just_pressed("Reset"):
		reset_scene()


func pause_menu():
	if paused:
		pause_panel.hide()
		Engine.time_scale = 1
	else:
		pause_panel.show()
		Engine.time_scale = 0
	
	paused = !paused

func reset_scene():
	get_tree().reload_current_scene() 


func _on_pause_panel_jump_level_select():
	Engine.time_scale = 1
	paused = !paused
	get_tree().change_scene_to_file("res://src/scene/level_select.tscn")
	


func _on_pause_panel_jump_main_menu():
	Engine.time_scale = 1
	paused = !paused
	get_tree().change_scene_to_file("res://src/scene/main_menu.tscn")


func _on_change_level_enter_change_area():
	get_tree().change_scene_to_file("res://src/scene/map1-1.tscn")


func _on_change_level_2_enter_change_area():
	get_tree().change_scene_to_file("res://src/scene/map1-1.tscn")


func _on_change_level_3_enter_change_area():
	get_tree().change_scene_to_file("res://src/scene/map1-1.tscn")


func _on_item_collect_enter_collect_true():
	heart1.visible = true
