extends Control

@onready var main = $"../../"

func _on_resume_pressed():
	main.pause_menu()


func _on_level_select_pressed():
	get_tree().change_scene_to_file("res://src/scene/level_select.tscn")
	

func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://src/scene/main_menu.tscn")

	
func _on_quit_pressed():
	get_tree().quit()
