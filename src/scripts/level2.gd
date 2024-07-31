extends Node2D

@onready var pause_panel = $CanvasLayer/Pause_panel
@onready var heart1 = $Heart
var paused = false

func _ready():
	$Player.position = Global.player_posision_level2

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
	Global.player_posision_level2 = Vector2($Player.position.x - 50, $Player.position.y)
	get_tree().change_scene_to_file("res://src/scene/map2-1.tscn")


func _on_change_level_2_enter_change_area():
	Global.player_posision_level2 = Vector2($Player.position.x - 50, $Player.position.y)
	get_tree().change_scene_to_file("res://src/scene/map2-2.tscn")


func _on_change_level_3_enter_change_area():
	Global.player_posision_level2 = Vector2($Player.position.x - 50, $Player.position.y)
	get_tree().change_scene_to_file("res://src/scene/map2-3.tscn")



func _on_change_level_4_enter_change_area():
	Global.player_posision_level2 = Vector2($Player.position.x + 50, $Player.position.y)
	get_tree().change_scene_to_file("res://src/scene/level_select.tscn")
